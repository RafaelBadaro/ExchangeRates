//
//  CurrencySymbolModel.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 16/10/23.
//

import Foundation

struct CurrencySymbolModel: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var fullName: String
}
