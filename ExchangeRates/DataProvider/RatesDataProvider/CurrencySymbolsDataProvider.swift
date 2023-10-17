//
//  CurrencySymbolsDataProvider.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 26/09/23.
//

import Foundation

protocol CurrencySymbolsDataProviderDelegate: DataProviderManageDelegate {
    func success(model: [CurrencySymbolModel])
}

class CurrencySymbolsDataProvider: DataProviderManager<CurrencySymbolsDataProviderDelegate, CurrencySymbolObject> {
    
    private let currencyStore: CurrencyStore
    
    init(currencyStore: CurrencyStore = CurrencyStore()){
        self.currencyStore = currencyStore
    }
    
    func fetchSymbols(){
        Task.init {
            do {
                let object = try await currencyStore.fetchSymbols()
                delegate?.success(model: object.map({ (symbol, fullName) ->  CurrencySymbolModel in
                    return CurrencySymbolModel(symbol: symbol, fullName: fullName)
                }))
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
