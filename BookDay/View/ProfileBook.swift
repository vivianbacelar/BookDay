//
//  ProfileBook.swift
//  BookDay
//
//  Created by Vivian Bacelar on 27/01/23.
//

import SwiftUI

struct ProfileBook: View {
    
    var page: Page
    private let pages: [Page] = Page.samplePages
    @State private var pageIndex = 0
    @EnvironmentObject var flowOrganizer: FlowOrganizer
    
    var body: some View {
        
        ForEach(Page.samplePages, id: \.id) { page in
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    Image(page.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame()
                        
                    Spacer()
                    
                    Text(page.title)
                        .font(Font.custom("Raleway", size: 20))
                        .multilineTextAlignment(.leading)
                    
                    Text(page.description)
                        .font(Font.custom("Raleway", size: 20))
                        .multilineTextAlignment(.leading)
                    
                    
                    //          
                    //
                    //                    Text(page.title)
                    //                        .font(Font.custom("Raleway", size: 20))
                    //                        .multilineTextAlignment(.leading)
                    //
                    //
                    //                    Text(page.description)
                    //                        .font(Font.custom("Raleway", size: 20))
                    //                        .multilineTextAlignment(.leading)
                    
                }
                
            }
            
//            if page == page.last{
//                .dismiss
//                }
        
            }
            
            
            .tag(page.tag)
            
        }
        
    }



struct ProfileBook_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBook(page: Page.samplePage)
    }
}
