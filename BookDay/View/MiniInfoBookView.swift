//
//  MiniInfoBookView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 27/02/23.
//

import SwiftUI

struct MiniInfoBookView: View {
    
        
        @State var item: Item
        @State private var selectedCells: Set<Item> = []
        @State var changePages = false
        
        
        
        var stars: Double {
            item.volumeInfo.averageRating ?? 0
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
                                        .foregroundColor(Color.corPreto)
                                }
                            }.padding(.bottom)
                                .padding(.leading, UIScreen.main.bounds.width/2)
                        }


                        Text(item.volumeInfo.title)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(Font.custom("Raleway", size: 20).weight(.bold))
                            .foregroundColor(Color.corPreta)
                            .padding(.horizontal, UIScreen.main.bounds.width/11.5)
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


                       
                        }
                        
                        
                    
                        VStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color.corCinzaClaro)
                                .frame(height:UIScreen.main.bounds.height/900)
                                .padding(.horizontal, UIScreen.main.bounds.width/14)
                            
                            Button {
                                changePages.toggle()
                            } label: {
                                Image("moveBookButton")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/2.3, height: UIScreen.main.bounds.height/18)
                            }

                            
                            Rectangle()
                                .foregroundColor(Color.corGelo)
                                .frame(height: UIScreen.main.bounds.height/8)
                        }.padding(.top, UIScreen.main.bounds.height/20)
                    }
                }
            
            .ignoresSafeArea()
            .overlay(alignment: .top){
                HStack {
                    Rectangle()
                        .foregroundColor(Color.corGelo.opacity(0.7))
                        .blur(radius: 4, opaque: false)
                        .frame(height: UIScreen.main.bounds.height/9)
                }.edgesIgnoringSafeArea(.all)
                if changePages {
                    ChangePages(showChanges: $changePages, selectedItem: item)
                }
                

            }
            
        }
        
    
}


