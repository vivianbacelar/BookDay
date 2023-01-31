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

     var body: some View {


         TabView {
             Library()
                 .tabItem {
                     Label("Library", systemImage: "books.vertical")
                }

            Home(page: Page.samplePage)
                .tabItem {
                    Label("Reading", systemImage: "book.fill")

                }
             SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }.tint(Color.corRosa)

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
                NSAttributedString.Key.foregroundColor: UIColor(named: "rosa")
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "cinza")
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "cinza")
            ]
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
