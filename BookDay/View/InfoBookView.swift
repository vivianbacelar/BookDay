//
//  SwiftUIView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 30/01/23.
//

import SwiftUI

struct InfoBookView: View {
    
    
    let item: Item
    @State private var selectedCells: Set<Item> = []
    @State var deleteAlert = false
    @Binding var countPage: String
    
    var percentage: Double {
        (Double(countPage) ?? 0 * 100) / (Double(item.volumeInfo.pageCount ?? 100))
        
    }
    
    var percentageText: String {
        var str = "\(percentage)"
        str += item.volumeInfo.pageCount != nil ? "%" : ""
        return str
    }
    
    var body: some View {
        
        ZStack(alignment: .top){
            
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
                        .font(Font.custom("Raleway", size: 25).weight(.bold))
                        .padding(.horizontal)
                        .padding(.bottom)
                    
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
                            //.animation(.easeInOut(duration: 0.2))
                            .padding(.vertical,5)
                    }.padding(.vertical)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.width/9.5)
                            .foregroundColor(Color.corFundo)
                        HStack{
                            
                            Text("Page")
                                .foregroundColor(Color.corCinza3)
                                .font(Font.custom("Raleway", size: 15).weight(.semibold))
                            
                            Spacer()
                            
                            TextField("0", text: $countPage)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .onSubmit {
                                    UserDefaults.standard.set(countPage, forKey: UserDefaultsKeys.countPage.rawValue)
                                }
                            
                          
                            
                        }.padding(.horizontal, UIScreen.main.bounds.width/11)
                        
                    }
                    
                    
                    
                    HStack{
                        Text("Progress")
                            .font(Font.custom("Raleway", size: 15).weight(.bold))
                        
                        Spacer()
                        Text(percentageText)
                            .font(Font.custom("Raleway", size: 15))
                        
                    }.padding(.horizontal, UIScreen.main.bounds.width/11)
                    
                    
                    VStack{
                        Button{
                            withAnimation{
                                deleteAlert.toggle()
                            }
                            print("delete")
                        }label:{
                            Image("deleteButtom")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/1.5)
                                
                            
                            
                        }.buttonStyle(.plain)
                        
                    }
                    
   
                    
                }
            }
            
            
            
        }
        .ignoresSafeArea()
        .overlay(alignment: .top){
            HStack {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.2))
                    .blur(radius: 6, opaque: false)
                    .frame(height: 95)
            }.edgesIgnoringSafeArea(.all)
            
            if deleteAlert {
                DeleteAlertView(showDelete: $deleteAlert)
            }
            
        }
        
        
        
    }
    
    //    var returnImage: some View {
    //        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail){ image in
    //            image
    //                .resizable()
    //                .scaledToFill()
    //        } placeholder: {
    //            Image("PlaceHolder")
    //                .resizable()
    //                .scaledToFill()
    //        }
    //
    //    }
}


struct DeleteAlertView: View {

    @Binding var showDelete: Bool
//    var selectedItem: Item?

    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack (spacing: 25){
                Image("sureDeleteButton")
                    .overlay(content: {
                        VStack{
                            Spacer()
                            
                            Button(action: {
//                                withAnimation{
                                    print("delButton")
                                    showDelete.toggle()
//                                }
                            }){
                                Image("delButton")
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




//struct InfoBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoBookView()
//    }
//}
