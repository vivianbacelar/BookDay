//
//  SearchView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var filteredItems: [Item] = []
    @State var customAlert = false
    @StateObject private var networkModel = NetworkModel()
    
    private var items: [Item]{
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
                                        Image(systemName: "book")
                                    }
                                    VStack {
                                        Text(item.volumeInfo.title)
                                            .font(Font.custom("RalewayRegular", size: 18))
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        //                                Text(item.volumeInfo.authors)
                                        //                                    .font(Font.custom("RalewayLight", size: 20))
                                        //                                    .multilineTextAlignment(.leading)
                                        //                                    .frame(maxWidth: .infinity, alignment: .leading)
                                        HStack {
                                            Spacer()
                                            Button (action:{
                                                withAnimation{
                                                    customAlert.toggle()
                                                }
                                            }) {
                                                Image(systemName: "plus.circle")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .foregroundColor(Color.corLaranja)
                                                    .padding(.trailing)
                                                //.padding(.horizontal)
                                            }
                                        }
                                        
                                        
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
                CustomAlertView(show: $customAlert)
            }
        })
        
        
        
    }
    
    private func performSearch (keyWord: String) {
        filteredItems = networkModel.items.filter{ item in
            item.volumeInfo.title.contains(keyWord)
        }
    }
    
}

struct BlurView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

struct CustomAlertView: View {
    
    @Binding var show: Bool
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack (spacing: 25){
                Image("bookStatus")
                    .overlay(content: {
                        VStack{
                            Spacer()
                            HStack{
                                Button{
                                    print("read")
                                }label:{
                                    Image("readButtom")
                                }
                                Button{
                                    print("reading")
                                }label:{
                                    Image("readingButtom")
                                }
                                Button{
                                    print("want to read")
                                }label:{
                                    Image("wantToReadButtom")
                                }
                            }.padding(.bottom)
                                .padding(.horizontal)
                            
                            
                            Button(action: {
                                withAnimation{
                                    show.toggle()
                                }
                            }){
                                Image("okButton")
                            }
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
    }
}
