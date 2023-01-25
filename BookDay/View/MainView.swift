//
//  MainView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
       
        TabView {
            Library()
                .tabItem {
                    Image("library")
                }
            Home()
                .tabItem {
                    Image("home")
                }
            Search()
                .tabItem {
                    Image("pesquisa")
                }.tint(Color("Verde"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
