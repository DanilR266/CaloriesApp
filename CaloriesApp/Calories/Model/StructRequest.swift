// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let text: String?
    let parsed: [Parsed]?


    enum CodingKeys: String, CodingKey {
        case text, parsed
    }
}

// MARK: - Hint
struct Hint: Codable {
    let food: HintFood?
    let measures: [Measure]?
}

// MARK: - HintFood
struct HintFood: Codable {
    let foodID, label, knownAs: String?
    let nutrients: Nutrients?
    let category: Category?
    let categoryLabel: CategoryLabel?
    let image: String?
    let brand, foodContentsLabel: String?
    let servingSizes: [ServingSize]?
    let servingsPerContainer: Double?

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, knownAs, nutrients, category, categoryLabel, image, brand, foodContentsLabel, servingSizes, servingsPerContainer
    }
}

enum Category: String, Codable {
    case genericFoods = "Generic foods"
    case packagedFoods = "Packaged foods"
}

enum CategoryLabel: String, Codable {
    case food = "food"
}

// MARK: - Nutrients
struct Nutrients: Codable {
    let enercKcal: Int?
    let procnt, fat, chocdf, fibtg: Double?

    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
    }
}

// MARK: - ServingSize
struct ServingSize: Codable {
    let uri: String?
    let label: String?
    let quantity: Double?
}

// MARK: - Measure
struct Measure: Codable {
    let uri: String?
    let label: String?
    let weight: Double?
    let qualified: [Qualified]?
}

// MARK: - Qualified
struct Qualified: Codable {
    let qualifiers: [Qualifier]?
    let weight: Int?
}

// MARK: - Qualifier
struct Qualifier: Codable {
    let uri: String?
    let label: Label?
}

enum Label: String, Codable {
    case diced = "diced"
    case melted = "melted"
    case shredded = "shredded"
}

// MARK: - Links
struct Links: Codable {
    let next: Next?
}

// MARK: - Next
struct Next: Codable {
    let title: String?
    let href: String?
}

// MARK: - Parsed
struct Parsed: Codable {
    let food: ParsedFood?
}

// MARK: - ParsedFood
struct ParsedFood: Codable {
    let foodID, label, knownAs: String?
    let nutrients: Nutrients?
    let category: Category?
    let categoryLabel: CategoryLabel?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, knownAs, nutrients, category, categoryLabel, image
    }
}
