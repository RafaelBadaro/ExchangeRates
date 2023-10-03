//
//  RatesHistoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 26/09/23.
//

import Foundation

protocol RatesHistoricalDataProviderDelegate: DataProviderManageDelegate {
    func success(model: RatesHistoricalObject)
}

class RatesHistoricalDataProvider: DataProviderManager<RatesHistoricalDataProviderDelegate, RatesHistoricalObject> {
    
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()){
        self.ratesStore = ratesStore
    }
    
    func fetchHistoricalRates(date: String, base: String, symbols: [String]){
        Task.init {
            do {
                let model = try await ratesStore.fetchHistoricalRates(by: date, base: base, from: symbols)
                delegate?.success(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
