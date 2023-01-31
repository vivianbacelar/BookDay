//
//  SwiftUIView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 30/01/23.
//

import SwiftUI

struct InfoBookView: View {
    
    //@Binding var info: Item
    let item: Item
    
    var body: some View {
        ZStack{
            
            Color.corGelo
                .ignoresSafeArea()
            NavigationView{
                ScrollView{
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
                        Spacer()
                        
                        Text(item.volumeInfo.title)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(Font.custom("RalewayBold", size: 20))
                            //.padding(.trailing,100)
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        Spacer()
                        
                        
                        LabelAlignment(text: item.volumeInfo.description ?? "", textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 80)
                            .font(Font.custom("Raleway", size: 15))
//                            .multilineTextAlignment(.leading)
//                            .lineLimit(3)
                            
                            
                        
                        Spacer()
                        
                        
                        
                    }
                }
                .toolbar {
                    }
                    //.frame(maxWidth: .infinity)
                    .background(Color.corGelo)
                    .toolbarBackground( Color.corGelo, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
        }.ignoresSafeArea()
        
        
    }
}

//struct InfoBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoBookView()
//    }
//}
