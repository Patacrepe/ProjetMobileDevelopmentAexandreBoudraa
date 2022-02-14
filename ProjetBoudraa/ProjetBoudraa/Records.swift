import Foundation
import UIKit
import SwiftUI
// Model
struct Records: Codable {
    let records: [Furniture]?
}
struct Furniture: Codable {
    let id: String
    let fields: Fields
}
struct Fields: Codable {
    let name: String
    let type: String?
    let images: [FurnitureImage]?
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case images = "Images"
} }
struct FurnitureImage: Codable {
    let url: String
}
struct Response: Codable {
    let id: String
    let deleted: Bool
}
struct ErrorResponse: Codable {
    let error: String
}
enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}
enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}
