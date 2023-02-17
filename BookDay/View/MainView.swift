//
//  MainView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI
import UIKit

class SelectionVM: ObservableObject {
    @Published var selection: Int = 2
    
    static var shared: SelectionVM = SelectionVM()
    
    private init() { }
}

struct MainView: View {
    
    
    
    @ObservedObject var selectionVM: SelectionVM = SelectionVM.shared
    @State var showLibraryTouch = true
//    @State var selection = 2

     var body: some View {


         TabView (selection: $selectionVM.selection) {
        
                 Library()
                 .tabItem {
                     Label("Library", image: selectionVM.selection == 1 ? "librarytouch" : "library")
                     }
                     .tag(1)
                 
                 
             Home(page: Page.samplePage)
                 
                     .tabItem {
                         Label("Reading", image: selectionVM.selection == 2 ? "hometouch" : "home")
                     }
                     .tag(2)
                 
                 
                 SearchView()
                     .tabItem {
                         Label("Search", image: selectionVM.selection == 3 ? "searchtouch" : "search")
                     }
                     .tag(3)
             
         }
         .onAppear() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "corgelo")
             appearance.shadowColor = .clear
            appearance.stackedItemPositioning = .centered
            appearance.stackedItemSpacing = 0
             appearance.selectionIndicatorTintColor = .black
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "corcinzaMaisEscuro")
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "corcinzaMaisEscuro")!
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "corcinza")
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "corcinza")!
            ]
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
        
            
            let appearenceNavBar = UINavigationBarAppearance()
            appearenceNavBar.configureWithTransparentBackground()
            appearenceNavBar.backgroundImage = UIImage().withTintColor(.blue)
            appearenceNavBar.backgroundColor = UIColor(Color.corCinzaEscuro).withAlphaComponent(0.5)
            appearenceNavBar.shadowColor = nil
            UINavigationBar.appearance().standardAppearance = appearenceNavBar
            UINavigationBar.appearance().scrollEdgeAppearance = appearenceNavBar
            UINavigationBar.appearance().isTranslucent = false
            
            }
         
        
         
        }
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

