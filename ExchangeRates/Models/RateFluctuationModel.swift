//
//  RateFluctuationModel.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 16/10/23.
//

import Foundation

struct RateFluctuationModel: Identifiable {
    let id = UUID()
    var symbol: String
    var change: Double
    var changePct: Double
    var endRate: Double
}
