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
                                
                            HStack{
                                // funciona com numeros inteiros mas se a avaliacao for 4.5 nao vai
                                ForEach(0 ..< Int(stars)) { i in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.corLaranja)
                                        .frame(width: UIScreen.main.bounds.width/28,height: UIScreen.main.bounds.height/50)
                                }
                                Text(String(stars))
                                    .font(Font.custom("RalewayBold", size: 18))
                                    .foregroundColor(Color.corPreta)
                            }
                        }.padding(.bottom)
                            .padding(.leading, UIScreen.main.bounds.width/2)
                    }
                    
                    Spacer()
                    
                    Text(item.volumeInfo.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .foregroundColor(Color.corPreta)
                        .font(Font.custom("RalewayBold", size: 25))
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
                            .padding(.vertical,5)
                    }.padding(.vertical)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.width/9.5)
                            .foregroundColor(Color.corFundo)
                        HStack{
                            
                            Text("Page")
                                .foregroundColor(Color.corCinzaMaisEscuro)
                                .font(Font.custom("RalewayBold", size: 15))
                            
                            Spacer()
                            
                            TextField("0", text: $countPage)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.corPreta)
                                .padding()
                                .onSubmit {
                                    UserDefaults.standard.set(countPage, forKey: UserDefaultsKeys.countPage.rawValue)
                                }
                        }.padding(.horizontal, UIScreen.main.bounds.width/11)
                        
                    }
                    HStack{
                        Text("Progress")
                            .font(Font.custom("RalewayBold", size: 15))
                            .foregroundColor(Color.corPreta)
                        
                        Spacer()
                        Text(percentageText)
                            .font(Font.custom("RalewayBold", size: 15))
                            .foregroundColor(Color.corPreta)
                        
                    }.padding(.horizontal, UIScreen.main.bounds.width/11)
                    
                    
                    VStack{
                        Button{
                            deleteAlert.toggle()
                            print("delete")
                        }label:{
                            Image("deleteButtom")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/1.8, height: UIScreen.main.bounds.height/5)
                         
                        }.buttonStyle(.plain)
                        Rectangle()
                            .foregroundColor(Color.corGelo)
                            .frame(height: UIScreen.main.bounds.height/10)
                    }
                }
            }
            
        }
        .ignoresSafeArea()
        .overlay(alignment: .top){
            HStack {
                Rectangle()
                    .foregroundColor(Color.corGelo.opacity(0.7))
                    .blur(radius: 4, opaque: false)
                    .frame(height: 95)
            }.edgesIgnoringSafeArea(.all)
            
            if deleteAlert {
                DeleteAlertView(showDelete: $deleteAlert)
            }
            
        }
    }
  
}


struct DeleteAlertView: View {

    @Binding var showDelete: Bool
//    var selectedItem: Item?

    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack (spacing: 25){
                Image("sureDeleteButton")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/1.5 ,height: UIScreen.main.bounds.height/4.5)
                    .overlay(content: {
                        VStack{
                            Spacer()

                            Button(action: {
                                    print("delButton")
                                    showDelete.toggle()
                            }){
                                Image("delButton")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/1.4 ,height: UIScreen.main.bounds.height/18)
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




//struct InfoBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoBookView()
//    }
//}
