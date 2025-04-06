// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quotesResponse = try? JSONDecoder().decode(QuotesResponse.self, from: jsonData)

import Foundation

// MARK: - QuotesResponse
struct QuotesResponse: Codable {
    let data: DataClass?
    let str: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case str = "statusCode"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let author, content: String?
}
