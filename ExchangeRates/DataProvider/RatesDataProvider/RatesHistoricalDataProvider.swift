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
    
    func fetchTimeseries(by base: String, from symbols: [String], startDate: String, endDate: String){
        Task.init {
            do {
                let model = try await ratesStore.fetchTimeseries(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
