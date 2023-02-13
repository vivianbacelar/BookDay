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
    private let userDefaults = UserDefaults.standard

    var items: [Item] {
        filteredItems.isEmpty ? networkModel.items: filteredItems
    }
    
    var body: some View {
        ZStack {

            Color.corGelo
                .ignoresSafeArea()
            NavigationView {

                ScrollView () {
                    VStack {
                        if items.isEmpty && !networkModel.searchEmpty {
                            VStack{
                                Spacer()

                                Text("So sorry, your book is not here 😭")
                                    .font(Font.custom("Raleway", size: 18))
                                    .foregroundColor(Color.corPreta)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.vertical,  UIScreen.main.bounds.height/3)

                            }
                        } else {
                            ForEach(items) { item in

                                VStack {

                                    HStack {
                                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 130, maxHeight: 150)
                                        } placeholder: {
                                            Image("PlaceHolder")
                                                .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxHeight: 150)
                                        }
                                        .padding(.trailing, 8)
                                        VStack(spacing: 5) {
                                            Text(item.volumeInfo.title)
                                                .font(Font.custom("Raleway", size: 18))
                                                .foregroundColor(Color.corPreta)
                                                .multilineTextAlignment(.leading)
                                                .frame(maxWidth: .infinity, alignment: .leading)

                                            Text(item.volumeInfo.authors?.first ?? "")
                                                .font(Font.custom("Raleway", size: 13).weight(.thin))
                                                .foregroundColor(Color.corPreta)
                                                .multilineTextAlignment(.leading)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.top,1)

                                            Spacer()

                                            HStack {
                                                Spacer()
                                                Button (action:{
//                                                    withAnimation{
                                                        customAlert.toggle()
                                                    //ação que inverte a boleana
                                                        selectedItem = item
//                                                    }
                                                }) {
                                                    Image("addButton")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30)
                                                        .foregroundColor(Color.corLaranja)
                                                }
                                                .buttonStyle(.plain)
                                            }
                                            .padding(.top)
                                        }
                                        .frame(maxHeight: .infinity)
                                    }
                                    .padding(.horizontal, 20)
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color.corCinzaClaro)
                                        .frame(height: 0.75)
                                        .padding(.horizontal, 20)
                                }
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
                            .font(Font.custom("BelyDisplay-Regular", size: 23))
                            .foregroundColor(Color.corPreta)
                      
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
                Image("bookStatus")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/2.6)
                    .overlay(content: {
                        VStack{
                            Spacer()
                            VStack{
                                Button{
                                    print("reading")
                                    show.toggle()
                                    DAO.shared.add(to: .reading, selectedItem!)
                                }label:{
                                    Image("readingButton")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                        .padding(.bottom, UIScreen.main.bounds.height/98)
                                }.buttonStyle(.plain)


                                Button{
                                    print("want to read")
                                    show.toggle()
                                    DAO.shared.add(to: .wantToRead, selectedItem!)
//
                                }label:{
                                    Image("wantToReadButton")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                        .padding(.bottom, UIScreen.main.bounds.height/98)
                                }.buttonStyle(.plain)

                                Button{
                                    print("read")
                                    show.toggle()
                                    DAO.shared.add(to: .read, selectedItem!)
                                }label:{
                                    Image("readButton")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                }.buttonStyle(.plain)

                            }
                            .padding(.bottom, UIScreen.main.bounds.height/47)

                            Button(action: {
                                withAnimation{
                                    print("okButton")
                                    show.toggle()
                                }
                            }){
                                Image("okButton")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/17.5)
                            }.buttonStyle(.plain)
                        }
                    })
            }
            .cornerRadius(20)


        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.corCinza3.opacity(0.7))
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
