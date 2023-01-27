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
    
    var body: some View {
        
        ZStack{
            Color.corGelo
                .ignoresSafeArea()
            
            
            VStack{
            
            Text(page.title)
                .font(Font.custom("Raleway", size: 20))
                .multilineTextAlignment(.leading)
                
                
            Text(page.description)
                .font(Font.custom("Raleway", size: 20))
                .multilineTextAlignment(.leading)
                
            }
 
        }
    }
}

struct ProfileBook_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBook(page: Page.samplePage)
    }
}
