//
//  StocksResponse.swift
//  CashAppChallenge
//
//  Created by Dhaval Sanjay Adhav on 7/26/22.
//

import Foundation

struct StocksResponse: Decodable {

    // MARK: - properties
    
    let stocks: [Stock]
}
