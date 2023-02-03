//
//  SaveInformations.swift
//  BookDay
//
//  Created by Vivian Bacelar on 03/02/23.
//

import Foundation

//class SaveInformations: ObservableObject {
//    static let instance = SaveInformations()
//
//    private init(){
//        self.wantToReadList = userDefaults.object(forKey: "Want to Read") as? Int ?? 0
//        self.readingList = userDefaults.object(forKey: "Reading") as? Int ?? 0
//        self.readList = userDefaults.object(forKey: "Read") as? Int ?? 0
//    }
//
//    private let userDefaults = UserDefaults.standard
//    private(set) var wantRead : Int = 0
//    private(set) var reading : Int = 0
//    private(set) var read : Int = 0
//
//
//    private(set) var livros: [Item] = []
//
//    func addFiveCoins(newCoins: Int = 5){
//        self.objectWillChange.send()
//        self.coins += newCoins
//        userDefaults.set(self.coins, forKey: "myCoins")
//    }
//
//    func addReceita(newReceita: Int = 1){
//        self.objectWillChange.send()
//        self.receita += newReceita
//        userDefaults.set(self.receita, forKey: "myReceita")
//    }
//
//    func subtract(coins : Int){
//        self.objectWillChange.send()
//        self.coins -= coins
//        userDefaults.set(self.coins, forKey: "myCoins")
//    }
//
//    /// Checa se da para comprar um cupom, se da
//    ///  adiciona na lista de cupons e retorna true
//    ///  retorna false c.c.
//    func buy(cupom: Cupom) -> Bool {
//        if self.hasMoney(for: cupom) {
//            print(cupom)
//            subtract(coins: cupom.custo)
//
//            self.cupons.append(cupom)
//            return true
//        }
//        return false
//    }
//
//    func hasMoney(for cupom: Cupom) -> Bool {
//        return self.coins >= cupom.custo
//    }
//
//    func getCoins() -> Int {
//        return self.coins
//    }
//    func getReceita() -> Int{
//        return self.receita
//    }
//}
