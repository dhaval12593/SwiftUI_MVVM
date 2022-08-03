//
//  Currency.swift
//  CashAppChallenge
//
//  Created by Dhaval Sanjay Adhav on 7/26/22.
//

import Foundation

enum Currency: String, Decodable {
    case usd = "USD"
    case unknown

    init(from decoder: Decoder) throws {
        self = try Currency(rawValue: decoder.singleValueContainer().decode(String.self)) ?? .unknown
    }
}

