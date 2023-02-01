//
//  MainView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI
import UIKit

struct MainView: View {

    @State var showLibraryTouch = true
    @State var selection = 2

     var body: some View {


         TabView (selection: $selection){
             Library()
                 .tabItem {
                     Label("Library", systemImage: "books.vertical")
                 }.tag(1)

            Home(page: Page.samplePage)

                .tabItem {
                    Label("Reading", systemImage: "book.fill")
                }.tag(2)
             
             SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }.tint(Color.corRosa)
                 .tag(3)

        }.onAppear() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "gelo")
            appearance.shadowColor = nil
            appearance.stackedItemPositioning = .centered
            appearance.stackedItemSpacing = 0
            appearance.selectionIndicatorTintColor = .red
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "rosa")
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "rosa")!
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "cinza")
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "cinza")!
            ]
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
            
            let appearenceNavBar = UINavigationBarAppearance()
            appearenceNavBar.configureWithTransparentBackground()
            appearenceNavBar.backgroundImage = UIImage().withTintColor(.blue)
            appearenceNavBar.backgroundColor = . white.withAlphaComponent(0.5)
            appearenceNavBar.shadowColor = nil
            UINavigationBar.appearance().standardAppearance = appearenceNavBar
            UINavigationBar.appearance().scrollEdgeAppearance = appearenceNavBar
            UINavigationBar.appearance().isTranslucent = true
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
