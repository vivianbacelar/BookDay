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

                ScrollView () {
                    VStack {

                        ForEach(items) { item in

                            VStack {
                                HStack {
                                    AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 130, maxHeight: 150)
//                                            .padding(.bottom)
                                    } placeholder: {
                                        Image("PlaceHolder")
                                            .resizable()
//                                                .padding(.top)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxHeight: 150)
//                                                .padding(.bottom)
                                    }
                                    .padding(.trailing, 8)
//                                    .border(.green)
                                    VStack(spacing: 5) {
                                        Text(item.volumeInfo.title)
                                            .font(Font.custom("Raleway", size: 18))
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                        Text(item.volumeInfo.authors?.first ?? "")
                                            .font(Font.custom("Raleway", size: 13).weight(.thin))
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top,1)

                                        Spacer()

                                        HStack {
                                            Spacer()
                                            Button (action:{
                                                withAnimation{
                                                    customAlert.toggle()
                                                    selectedItem = item
                                                }
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
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $networkModel.search, placement: .navigationBarDrawer(displayMode: .always))
//                    .onChange(of: networkModel.search) { value in
//                        async{
//                            if !value.isEmpty && value.count > 1 {
//                                networkModel.search
//                            }else {
//                                networkModel.items.removeAll()
//                            }
//                        }
//                    }
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
                Image("bookStatus2")
                    .overlay(content: {
                        VStack{
                            Spacer()
                            VStack{
                                Button{
                                    print("reading")
                                    show.toggle()
                                    DAO.shared.addToReadingList(item: selectedItem!)

                                }label:{
                                    Image("readingButtom2")
                                        .padding(.bottom, UIScreen.main.bounds.height/150)
                                }.buttonStyle(.plain)

                                Button{
                                    print("want to read")
                                    show.toggle()
                                    DAO.shared.addToWantList(item: selectedItem!)

                                }label:{
                                    Image("wantToReadButtom2")
                                       .padding(.bottom, UIScreen.main.bounds.height/150)
                                }.buttonStyle(.plain)

                                Button{
                                    print("read")

                                    show.toggle()
                                    DAO.shared.addToReadList(item: selectedItem!)
                                }label:{
                                    Image("readButtom2")
                                        .padding(.bottom, UIScreen.main.bounds.height/45)
                                }.buttonStyle(.plain)

                            }


                            Button(action: {
                                withAnimation{
                                    print("okButton")
                                    show.toggle()
                                }
                            }){
                                Image("okButton2")
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
