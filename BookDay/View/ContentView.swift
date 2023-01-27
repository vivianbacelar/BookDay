//
//  ContentView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import SwiftUI

struct ContentView: View {

    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    @State private var showingLibrary = false
    
    var body: some View {

        NavigationView{

            VStack{

                Spacer()
                ProgressBar(width: 200, height: 30, percent: percent, color: .corRosa)

                HStack (spacing: 120) {

                    Text("\(Int(percent))%")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.leading)

                    //Descobrir como colocar o número da página que está
                    Text("\(Int(numberPage))")
                        .font(.system(size: 20, weight: .bold))


                }


                TabView(selection: $pageIndex){
                    ForEach(pages) {page in

                        VStack (spacing: 20){

                            Home(page: page)

                            if page == pages.last{
                                Button (action: goToZero) {

                                }.buttonStyle(.plain)

                                NavigationLink("", destination: Library(), isActive: $showingLibrary)
                            } else{
                                Button (action: addPage) {

                                }.buttonStyle(.plain)

                            }


                        }
                        .tag(page.tag)

                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear{
                    dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corRosa)
                    dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
                    dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)

                }
            }
        }


    }

    func addPage() {
        pageIndex += 1
    }

    func goToZero() {
        pageIndex = 0
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
