//
//  RatesHistoricalModel.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 16/10/23.
//

import Foundation
struct RatesHistoricalModel: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var period: Date
    var endRate: Double
}
