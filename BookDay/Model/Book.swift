//
//  Book.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    //let kind: String
   // let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
   // let kind: Kind
    let id: String
   // let etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    //let saleInfo: SaleInfo
    //let accessInfo: AccessInfo
   // let searchInfo: SearchInfo?
}

/*
// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool
}
enum AccessViewStatus: String, Codable {
    case none = "NONE"
}
enum Country: String, Codable {
    case br = "BR"
}
 
// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
}
enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}
enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
}
enum Kind: String, Codable {
    case booksVolume = "books#volume"
}
// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
}
enum Saleability: String, Codable {
    case notForSale = "NOT_FOR_SALE"
}
// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}
 */

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publishedDate: String?
    let description: String
  //  let industryIdentifiers: [IndustryIdentifier]
   // let readingModes: ReadingModes
    let pageCount: Int
   // let printType: PrintType
    let categories: [String]
    let averageRating: Double?
    //let ratingsCount: Int?
    //let maturityRating: MaturityRating
   // let allowAnonLogging: Bool
   // let contentVersion: ContentVersion
    let language: Language
    //let previewLink, infoLink: String
    //let canonicalVolumeLink: String
    //let panelizationSummary: PanelizationSummary?
    let subtitle, publisher: String?
    let imageLinks: ImageLinks?
}

/*
enum ContentVersion: String, Codable {
    case preview100 = "preview-1.0.0"
    case the1550Preview2 = "1.5.5.0.preview.2"
}
 */

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

enum Language: String, Codable {
    case pt = "pt"
    case ptBR = "pt-BR"
}
/*
// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String
}
enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}
 
enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}
// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}
enum PrintType: String, Codable {
    case book = "BOOK"
}
// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}
*/
