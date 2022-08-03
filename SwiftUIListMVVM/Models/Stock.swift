//
//  Stock.swift
//  CashAppChallenge
//
//  Created by Dhaval Sanjay Adhav on 7/26/22.
//

import Foundation

struct Stock: Decodable, Identifiable {

    // MARK: - properties

    let id = UUID()
    let ticker: String
    let name: String
    let currency: Currency
    let currentPriceInCents: Int
    let quantity: Int?
    let currentPriceTimestamp: Int

    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case currency
        case currentPriceInCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"

    }

}

extension Stock: Hashable {

}

