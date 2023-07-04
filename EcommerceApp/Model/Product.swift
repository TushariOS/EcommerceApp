//
//  Product.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import Foundation

// MARK: - Welcome
struct ProductList: Codable, Hashable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable, Hashable, Identifiable {
    let title, id: String
    let imageURL: String
    let price: [Price]
    let ratingCount: Double
    let messages: Messages
    let isAddToCartEnable: Bool
    let addToCartButtonText: AddToCartButtonText
    var isInTrolley, isInWishlist: Bool

    enum CodingKeys: String, CodingKey {
        case title, id, imageURL, price, ratingCount, messages, isAddToCartEnable, addToCartButtonText, isInTrolley, isInWishlist
    }
}

enum AddToCartButtonText: String, Codable, Hashable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Messages
struct Messages: Codable, Hashable {
    let secondaryMessage: String?
//    let sash: Sash
    let promotionalMessage: String?
}

// MARK: - Sash
//struct Sash: Codable {
//}

// MARK: - Price
struct Price: Codable, Hashable {
    let message: Message
    let value: Double
    let isOfferPrice: Bool
}

enum Message: String, Codable, Hashable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}
