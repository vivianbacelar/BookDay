//
//  TextEditorView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 15/02/23.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var item: Item
    @State var textEditorText: String = ""
   // @State var savedText: [String] = []
    
    var body: some View {
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                VStack (alignment: .leading){
                    Spacer()
                    Text("Tell us what you just read")
                        .font(Font.custom("Raleway", size: 15).weight(.bold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.corPreta)
                        .padding(.horizontal, UIScreen.main.bounds.width/30)
                    
                    TextEditor(text: $textEditorText)
                        .frame(height: UIScreen.main.bounds.height/5)
                        .colorMultiply(Color.corFundo)
                        .cornerRadius(15)
                        . onSubmit{
                            didAdd(text: textEditorText)
                            
                        }
                    
                    Button {
                        didAdd(text: textEditorText)
                        UIApplication.shared.endEditing()
                    } label: {
                        Text("Save")
                            .font(Font.custom("Raleway", size: 15).weight(.bold))
                            .foregroundColor(Color.corPreta)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.corRosa)
                            .cornerRadius(15)
                        
                    }.buttonStyle(.plain)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach (item.savedText ?? [], id: \.self){ saved in
                                Text(saved)
                                    .font(Font.custom("Raleway", size: 15).weight(.bold))
                                    .foregroundColor(Color.corPreta)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/7)
                                    .background(Color.corFundo)
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
    }
    
    func didAdd(text: String) {
        
        if text != "" {
            textEditorText = ""
            item.updateSave(textEditorText: text)
            print(item.savedText)
            print("save")
        }
    }
}

//struct TextEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextEditorView()
//    }
//}
