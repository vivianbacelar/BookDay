//
//  SwiftUIView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 30/01/23.
//

import SwiftUI

struct InfoBookView: View {
    
    @State var item: Item
    @State private var selectedCells: Set<Item> = []
    @State var deleteAlert = false
    @State var finishedBook = false
    @State var countPage: String = "0"
    
    var stars: Double {
        item.volumeInfo.averageRating ?? 0
    }
    
    var percentage: Double {
        ((Double(countPage) ?? 0.0) * 100) / (Double(item.volumeInfo.pageCount ?? 100))
    }
    
    
    var percentageText: String {
        let formattedValue = String(format: "%.2f", percentage)
        var str = "\(formattedValue)"
        str += item.volumeInfo.pageCount != nil ? "%" : ""
        return str
    }
    

    
    var body: some View {
        
        ZStack(alignment: .top){
            Color.corGelo
            ScrollView{
                VStack{
                    
                    VStack{
                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail){ image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image("PlaceHolder")
                                .resizable()
                                .scaledToFill()
                        }
                    }.overlay(alignment: .bottom){
                        ZStack{
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.width/13)
                                .foregroundColor(Color.white.opacity(0.7))
                            
                            HStack {
                                ForEach(0 ..< Int(stars)) { i in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.corLaranja)
                                        .frame(width: UIScreen.main.bounds.width/28,height: UIScreen.main.bounds.height/50)
                                }
                                if Int(stars * 2) % 2 != 0 {
                                    Image(systemName: "star.leadinghalf.filled")
                                        .foregroundColor(Color.corLaranja)
                                        .frame(width: UIScreen.main.bounds.width/28,height: UIScreen.main.bounds.height/50)
                                }
                                
                                Text(String(stars))
                                    .font(Font.custom("Raleway", size: 18))
                                    .foregroundColor(Color.corPreta)
                            }
                        }.padding(.bottom)
                            .padding(.leading, UIScreen.main.bounds.width/2)
                    }


                    Text(item.volumeInfo.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .font(Font.custom("Raleway", size: 20).weight(.bold))
                        .foregroundColor(Color.corPreta)
                        .padding(.horizontal, UIScreen.main.bounds.width/14)
                        .padding(.top)
                        .padding(.bottom, UIScreen.main.bounds.height/80)
                    
                    Spacer()
                    
                    VStack{
                        ContentCell(item: item, isExpanded: self.selectedCells.contains (item))
                            .onTapGesture {
                                if self.selectedCells.contains(item) {
                                    self.selectedCells.remove (item)
                                } else {
                                    self.selectedCells.insert (item)
                                }
                            }
                         }
                    .padding(.bottom,UIScreen.main.bounds.height/30)


                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.width/9.5)
                            .foregroundColor(Color.corFundo)
                        
                            HStack{
                                
                                Text("Page")
                                    .font(Font.custom("Raleway", size: 15).weight(.semibold))
                                    .foregroundColor(Color.corCinzaMaisEscuro)
                                
                                Spacer()
                                
                                TextField(countPage, text: $countPage)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color.corPreta)
                                    .padding()
                                    .onSubmit {
                                        item.countPage = countPage
                                        print("SUBMITOU")
                                    }
                            }.padding(.horizontal, UIScreen.main.bounds.width/11)
                            
                        }
                    }
                    
                    HStack{
                        Text("Progress")
                            .font(Font.custom("Raleway", size: 15).weight(.bold))
                            .foregroundColor(Color.corPreta)
                        
                        Spacer()
                        if percentage <= 100{
                            Text(percentageText)
                                .font(Font.custom("Raleway", size: 15).weight(.bold))
                                .foregroundColor(Color.corPreta)
                        }else{
                            Text("100%")
                                .font(Font.custom("Raleway", size: 15).weight(.bold))
                                .foregroundColor(Color.corPreta)
                        }
                        
                        
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width/11)
                    .padding(.top, UIScreen.main.bounds.height/30)
                    .padding(.bottom, UIScreen.main.bounds.height/50)
                    
                    VStack{
                    
                        ProgressBarView(progress: percentage)
                    
                    }
                
                    VStack{
                        TextEditorView(item: $item)
                    }.padding(.top, UIScreen.main.bounds.height/40)
                
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.corCinzaClaro)
                            .frame(height:UIScreen.main.bounds.height/900)
                            .padding(.horizontal, UIScreen.main.bounds.width/14)
                        HStack {
                            
                            Button {
                                finishedBook.toggle()
                                print("finished")
                            }label:{
                                Image("finishedBook")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/2.1, height: UIScreen.main.bounds.height/18)
                                    .padding(.vertical, UIScreen.main.bounds.height/28)
                                    

                            }.buttonStyle(.plain)

                            
                            Spacer()
                            Button{
                                deleteAlert.toggle()
                                print("abandon")
                            }label:{
                                Image("abandButton")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/3.2, height: UIScreen.main.bounds.height/23)
                                    .padding(.vertical, UIScreen.main.bounds.height/28)

                            }.buttonStyle(.plain)
                            
                        } .padding(.horizontal, UIScreen.main.bounds.width/15)
                        Rectangle()
                            .foregroundColor(Color.corGelo)
                            .frame(height: UIScreen.main.bounds.height/12)
                    }.padding(.top, UIScreen.main.bounds.height/20)
                }
            }
           
        .onAppear { // salva countPage
            countPage = item.countPage ?? ""
            item.countPage = countPage
        }
        .ignoresSafeArea()
        .overlay(alignment: .top){
            HStack {
                Rectangle()
                    .foregroundColor(Color.corGelo.opacity(0.7))
                    .blur(radius: 4, opaque: false)
                    .frame(height: UIScreen.main.bounds.height/9)
            }.edgesIgnoringSafeArea(.all)
            
            if deleteAlert {
                DeleteAlertView(deleteAlert: $deleteAlert, selectedItem: item)
            }
            if finishedBook{
                FinishedBookView(finishedBook: $finishedBook, selectedItem: item)
            }

        }
        
    }
    
}


struct DeleteAlertView: View {

    @Binding var deleteAlert: Bool
    @Environment(\.dismiss) var dismiss
    var selectedItem: Item

    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {

            VStack (spacing: 25){
                Image("sureAbandon")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4.6)
                    .overlay {
                        Button {
                            print("close")
                            deleteAlert = false
                        } label: {
                            Image("closeBottom")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/25, height: UIScreen.main.bounds.height/50)
                                .padding(.bottom,UIScreen.main.bounds.height/7)
                                .padding(.trailing,UIScreen.main.bounds.width/2)
                        }.buttonStyle(.plain)

                        Spacer()

                        Button{
                            print("abandon")
                            deleteAlert = false
                            DAO.shared.change(item: selectedItem, from: .reading, to: .abandon)
                            dismiss()
                        } label: {
                            Image("abandonBottom")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/18)
                                .padding(.top,UIScreen.main.bounds.height/6.1)

                            
                        }.buttonStyle(.plain)
                    }
            }
            .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.corCinza3.opacity(0.7))
    }
}


struct FinishedBookView: View {

    @Binding var finishedBook: Bool
    @Environment(\.dismiss) var dismiss
    var selectedItem: Item

    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {

            VStack (spacing: 25){
                Image("sureFinished")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4.6)
                    .overlay {
                        Button {
                            print("close")
                            finishedBook = false
                        } label: {
                            Image("closeBottom")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/25, height: UIScreen.main.bounds.height/50)
                                .padding(.bottom,UIScreen.main.bounds.height/7)
                                .padding(.trailing,UIScreen.main.bounds.width/2)
                        }.buttonStyle(.plain)

                        Spacer()

                        Button{
                            print("finished")
                            finishedBook = false
                            DAO.shared.change(item: selectedItem, from: .reading, to: .read)
                            dismiss()
                        } label: {
                            Image("finishedButton")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/18)
                                .padding(.top,UIScreen.main.bounds.height/6.1)

                            
                        }.buttonStyle(.plain)
                    }
            }
            .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.corCinza3.opacity(0.7))
    }
}
