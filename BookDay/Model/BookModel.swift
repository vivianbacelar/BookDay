////
////  BookModel.swift
////  BookDay
////
////  Created by Vivian Bacelar on 26/01/23.
////
//
//import Foundation
//import SwiftUI
//import CodableExtensions
//
//
//
//enum Level: String, CaseIterable, Identifiable, Codable {
//    var id : String{ self.rawValue }
//    case easy = "Básico"
//    case medium = "Intermediário"
//    case hard = "Avançado"
//}
//
//class Book: ObservableObject, Identifiable {
//    static var lastId: Int = 0
//    let id: Int
//    let name : String
//    let image : String
//    let description : String
//    var ingredientes: [Ingrediente] = []
//    let recipeTime : String
//    let level : Level
//    var instructions: [PageViewContent] = []
//    @Published var favorites : Bool
//    var hasCompleted: Bool
//    
//    
//    init(id:Int = Recipe.lastId,
//         name: String,
//         image: String,
//         description: String,
//         ingredientes: [Ingrediente],
//         recipeTime: String,
//         level: Level,
//         instructions: [PageViewContent],
//         favorites:Bool = false,
//         hasCompleted:Bool = false) {
//        
//        self.id = Recipe.lastId
//        self.name = name
//        self.image = image
//        self.description = description
//        self.ingredientes = ingredientes
//        self.recipeTime = recipeTime
//        self.instructions = instructions
//        self.level = level
//        self.hasCompleted = hasCompleted
//        self.favorites = favorites
//        Recipe.lastId += 1
//    }
//    
//    convenience init(from recipe: AppData.RecipePersist) {
//        self.init(id: recipe.id,
//                  name: recipe.name,
//                  image: recipe.image,
//                  description: recipe.description,
//                  ingredientes: recipe.ingredientes,
//                  recipeTime: recipe.recipeTime,
//                  level: recipe.level,
//                  instructions: recipe.instructions,
//                  favorites: recipe.favorites,
//                  hasCompleted: recipe.hasCompleted)
//    }
//    
//    
//    var allIngredients: String {
//        let nomeIngredients: [String] =  ingredientes.map({$0.alimento}).filter({$0 != ""})
//        let nomesJuntos = nomeIngredients.joined(separator: ", ")
//        
//        let primeiraLetra = nomesJuntos.prefix(1).capitalized
//        let restante = nomesJuntos.dropFirst()
//        return primeiraLetra + restante
//    }
//    
//}
//
//
//// To Persist
//
//
//enum UserDefaultsKeys: String {
//    case username = "username"
//}
//
//
//class AppData:Codable {
//    static var shared = AppData()
//    private init(){}
//    
//    class RecipePersist: Codable {
//        let id:Int
//        let name : String
//        let image : String
//        let description: String
//        let ingredientes : [Ingrediente]
//        let instructions: [PageViewContent]
//        let recipeTime : String
//        let level : Level
//        var favorites : Bool
//        var hasCompleted: Bool
//        
//        init(id: Int, name: String, image: String, description: String, ingredientes: [Ingrediente], recipeTime: String, level: Level, instructions: [PageViewContent], favorites: Bool, hasCompleted: Bool) {
//            self.id = id
//            self.name = name
//            self.image = image
//            self.description = description
//            self.ingredientes = ingredientes
//            self.recipeTime = recipeTime
//            self.instructions = instructions
//            self.level = level
//            self.favorites = favorites
//            self.hasCompleted = hasCompleted
//        }
//        convenience init(from recipe: Recipe) {
//            self.init(id: recipe.id,
//                      name: recipe.name,
//                      image: recipe.image,
//                      description: recipe.description,
//                      ingredientes: recipe.ingredientes,
//                      recipeTime: recipe.recipeTime,
//                      level: recipe.level,
//                      instructions: recipe.instructions,
//                      favorites: recipe.favorites,
//                      hasCompleted: recipe.hasCompleted)
//        }
//    }
//    var easyRecipe: [RecipePersist] = []
//    var mediumRecipe: [RecipePersist] = []
//    var hardRecipe: [RecipePersist] = []
//    
//    private(set) var coins : Int = 0
//    
//    func add(newCoins: Int = 10){
//        self.coins += newCoins
//    }
//    private(set) var receita : Int = 0
//    
//    func add(newReceita: Int = 10){
//        self.coins += newReceita
//    }
//    
//     func saveData() {
//        self.easyRecipe = AllRecipes.instance.easyRecipe.map{item in return RecipePersist(from: item)}
//        self.mediumRecipe = AllRecipes.instance.mediumRecipe.map{item in return RecipePersist(from: item)}
//        self.hardRecipe = AllRecipes.instance.hardRecipe.map{item in return RecipePersist(from: item)}
//        self.coins = AllRecipes.instance.coins
//        try? self.save()
//        
//    }
//    
//    static func loadData() {
//        guard let loaded = (try? AppData.load()) else {return}
//        Self.shared = loaded
//        
//        AllRecipes.instance.easyRecipe = shared.easyRecipe.map{item in return Recipe(from: item)}
//        AllRecipes.instance.mediumRecipe = shared.mediumRecipe.map{item in return Recipe(from: item)}
//        AllRecipes.instance.hardRecipe = shared.hardRecipe.map{item in return Recipe(from: item)}
//        AllRecipes.instance.coins = Self.shared.coins
//        
//    }
//}
//
//struct Ingrediente: Identifiable, Codable {
//    var id = UUID()
//    var quantidade: String
//    var alimento: String
//    var parte: String
//    var separador: String
//    
//    init(parte: String) {
//        self.parte = parte
//        self.quantidade = ""
//        self.alimento = ""
//        self.separador = ""
//    }
//    
//    init(quantidade: String, alimento: String, separador: String = " de ") {
//        self.quantidade = quantidade
//        self.alimento = alimento
//        self.parte = ""
//        self.separador = separador
//    }
//    
//    var texto: String {
//        if alimento == "" {
//            return parte
//        }
//        let complemento = alimento == "" ? "" : self.separador + self.alimento
//        
//        return "- " + quantidade + complemento
//    }
//}

