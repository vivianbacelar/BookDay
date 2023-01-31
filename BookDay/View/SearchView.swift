//
//  SearchView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//


import SwiftUI

struct SearchView: View {
    
    @State var filteredItems: [Item] = []
    @State var customAlert = false
    @StateObject var networkModel = NetworkModel()
    @State var selectedItem: Item?
    
    var items: [Item]{
        filteredItems.isEmpty ? networkModel.items: filteredItems
    }
    
    var body: some View {
        ZStack {
            Color.corGelo
                .ignoresSafeArea()
            NavigationView {
                
                ScrollView {
                    VStack {
                        
                        ForEach(items) { item in
                            
                            VStack {
                                HStack {
                                    AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                                        image.resizable()
                                            .padding(.top)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 200, maxHeight: 150)
                                            .padding(.bottom)
                                    } placeholder: {
                                        Image("PlaceHolder")
                                            .resizable()
                                            .padding(.top)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 200, maxHeight: 150)
                                            .padding(.bottom)
                                    }
                                    VStack {
                                        Text(item.volumeInfo.title)
                                            .font(Font.custom("RalewayRegular", size: 18))
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text(item.volumeInfo.authors?.first ?? "")
                                            .font(Font.custom("RalewayLight", size: 15))
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top,1)
                                        
                                        
                                        HStack {
                                            Spacer()
                                            Button (action:{
                                                withAnimation{
                                                    customAlert.toggle()
                                                    selectedItem = item
                                                }
                                            }) {
                                                Image("AddButtom")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .padding(.trailing)
                                                    .padding(.horizontal)
                                            }.buttonStyle(.plain)
                                        }.padding(.top)
                                        
                                        
                                    }
                                }
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color.corCinzaClaro)
                                    .frame(height: 1)
                                    .padding(.horizontal, 30)
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $networkModel.search, placement: .navigationBarDrawer(displayMode: .always))
                    .padding(.vertical)
                    .onSubmit(of: .search) {
                        Task {
                            do {
                                try await networkModel.fetchBooks()
                            } catch {
                                print(error)
                            }
                        }
                    }
                    .onChange(of: networkModel.search, perform: performSearch)
                    
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("BookDay")
                            .font(Font.custom("BelyDisplay-Regular", size: 35))
                    }
                }.frame(maxWidth: .infinity)
                    .background(Color.corGelo)
                    .toolbarBackground( Color.corGelo, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
            .edgesIgnoringSafeArea(.all)
            
        }.overlay(content: {
            if customAlert {
                CustomAlertView(show: $customAlert, selectedItem: selectedItem)
            }
        })
        
        
        
    }
    
    
    
    private func performSearch (keyWord: String) {
        filteredItems = networkModel.items.filter{ item in
            item.volumeInfo.title.contains(keyWord)
        }
    }
    
}


struct CustomAlertView: View {
    
    @Binding var show: Bool
    var selectedItem: Item?
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack (spacing: 25){
                Image("bookStatus1")
//                    .resizable()
                    //.scaledToFit()
//                    .frame(width: UIScreen.main.bounds.width/1.25, height: UIScreen.main.bounds.height/4.73)
                    .overlay(content: {
                        VStack{
                            Spacer()
                            HStack{
                                Button{
                                    print("read")
                                    show.toggle()
                                }label:{
                                    Image("readButtom1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.height/7)
                                }.buttonStyle(.plain)
                                
                                Button{
                                    print("reading")
                                    show.toggle()
                                    DAO.shared.addToReadingList(item: selectedItem!)
                                }label:{
                                    Image("readingButtom1")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/5.5)
                                }.buttonStyle(.plain)
                                
                                Button{
                                    print("want to read")
                                    show.toggle()
                                }label:{
                                    Image("wantToReadButtom1")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: UIScreen.main.bounds.width/3.8, height: UIScreen.main.bounds.height/3.8)
                                }.buttonStyle(.plain)
                                
                            }
                            Button {
                                withAnimation{
                                    show.toggle()
                                }
                            } label: {
                                Image("okButton1")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: UIScreen.main.bounds.width/10, height: UIScreen.main.bounds.height/10)
                            }.buttonStyle(.plain)
                        }
                    })
            }
            .background(BlurView())
            .cornerRadius(20)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.corCinzaEscuro.opacity(0.7))
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.corCinzaEscuro.opacity(0.7))
        
    }
    
}

//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            SearchView( livro: $livro)
//        }
//    }
//}
