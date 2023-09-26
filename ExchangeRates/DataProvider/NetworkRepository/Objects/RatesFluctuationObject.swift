//
//  RatesFluctuationObject.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 25/09/23.
//

import Foundation

typealias RatesFluctuationObject = [String: FluctuationObject]

struct FluctuationObject: Codable {
    
    let change: Double
    let changePct: Double
    let endRate: Double
    
    enum CodingKeys: String, CodingKey {
        case change
        case changePct = "change_pet"
        case endRate = "end_rate"
    }
}
