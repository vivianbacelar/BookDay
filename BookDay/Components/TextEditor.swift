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
                
                VStack {
                    Spacer()
                    Text("Tell us what you just read")
                        .font(Font.custom("Raleway", size: 15).weight(.medium))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.corPreta)
                        .padding(.trailing, UIScreen.main.bounds.width/2.8)
                        .padding(.bottom, UIScreen.main.bounds.height/80)
                    
                    TextEditor(text: $textEditorText)
                        .scrollContentBackground(.hidden)
                        .frame(width: UIScreen.main.bounds.width/1.15,height: UIScreen.main.bounds.height/5)
                        .colorMultiply(Color.corPreta)
                        .background(Color.corFundo)
                        .cornerRadius(15)
                        . onSubmit{
                            didAdd(text: textEditorText)
                        }
                    HStack {
                        NavigationLink {
                            LastNotesView(item: item)
                        } label: {
                            Text("Last Notes")
                                .font(Font.custom("Raleway", size: 15).weight(.regular))
                                .foregroundColor(Color.corRosa)
                                .padding()
                        }.buttonStyle(.plain)
                            
                        
                        Spacer()
                        
                        Button {
                            didAdd(text: textEditorText)
                            UIApplication.shared.endEditing()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: UIScreen.main.bounds.width/5.8, height: UIScreen.main.bounds.height/30)
                                    .foregroundColor(Color.corRosa)
                                Text("Save")
                                    .font(Font.custom("Raleway", size: 15).weight(.regular))
                                    .foregroundColor(Color.corGelo)
                                    .padding()
                                
                            }
                            
                        }.buttonStyle(.plain)
                    } .padding(.horizontal, UIScreen.main.bounds.width/30)
                    
                    
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
