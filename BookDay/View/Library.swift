//
//  LibraryView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.


import SwiftUI
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }
    var medium: UIFont { return withWeight(.medium) }
    var regular: UIFont { return withWeight(.regular) }
    var light: UIFont { return withWeight(.light) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
struct Library: View {

    @State private var selected = "Want to Read"
    /// Lista que é mostrada de fato
    @State var livros: [Item] = []
    @State var count: Int = 0
//    let itens: [Item]

    //    let attr = NSDictionary(object: UIFont(name: "Raleway", size: 16.0)!], forKey: NSFontAttributeName)
    //    seg.setTitleTextAttributes(attr as [NSObject : AnyObject] , forState: .Normal)
    //
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "cinzaClaro")
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont(name: "Raleway", size: 18)!.regular,
                .foregroundColor: UIColor(named: "preto")!
            ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont(name: "Raleway", size: 18)!.regular,
                .foregroundColor: UIColor(named: "cinzaMaisEscuro")!
            ], for: .normal)

    }



    var body: some View {

        ZStack{
            Color.corGelo
                .ignoresSafeArea()


            VStack{

                Text("BookDay")
                    .font(Font.custom("BelyDisplay-Regular", size: 23))
                    .padding(.top, 40)
                    .padding(.bottom, 40)

                Picker("", selection: $selected){


                    Text("Want to Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Want to Read")

                    Text("Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Read")


                }
                .pickerStyle(.segmented)
                .frame(width: 300)

                ScrollView() {
                    ZStack {
                        shelfBooks
                        collectionBooks
//                        ChangePages(show: $volumeInfo)

                    }
                }

            }.padding(.horizontal, 10)
        }
        //TODO: melhorar, entender DAO no SwiftUI
        // depois explicar pro pg

        .onAppear(){
            livros = getBook(of: selected)
        }.onChange(of: selected) { newValue in
            livros = getBook(of: newValue)
        }

//        .onDelete (){ { newValue in
//            livros = deleteBook(of: newValue)
//        }
    }

    func getBook(of selected: String) -> [Item] {
        if selected == "Want to Read" {
            return DAO.shared.wantToReadList
        } else {
            return DAO.shared.readList
        }
    }
//
//    func deleteBook(of selected: ImageLinks) -> [Item]{
//        if selected ==  AsyncImage(url: page.volumeInfo.imageLinks?.thumbnail){
//            return DAO.shared.readingList
//        }
//    }
//
    let colums: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var collectionBooks: some View {

            VStack {
                LazyVGrid(columns: colums) {
                    ForEach(livros, id: \.id) { item in
                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                            image.resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 150)
                                .padding(.bottom)
                        } placeholder: {
                            Image("PlaceHolder")
                                .resizable()
                                    .padding(.top)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 150)
                                    .padding(.bottom)

                        }

                    }
                }
                Spacer()
            }

    }

    var shelfNumber: Int {
        return max(3, Int((livros.count + 2) / 3))
    }

    var shelfBooks: some View {

        VStack {
            ForEach((1...shelfNumber), id:\.self) { _ in
                Rectangle()
                    .fill(.clear)
                    .frame(width: 310, height: 150)

                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 310, height: 8)
            }
        }

    }
}


    struct Library_Previews: PreviewProvider {
        static var previews: some View {
            Library()
        }
    }
