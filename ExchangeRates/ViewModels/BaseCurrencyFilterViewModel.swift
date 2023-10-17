 //
//  BaseCurrencyFilterViewModel.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 16/10/23.
//

import Foundation
import SwiftUI

extension BaseCurrencyFilterView {
    @MainActor class ViewModel: ObservableObject , CurrencySymbolsDataProviderDelegate{
        @Published var currencySymbols: [CurrencySymbolModel] = [
            CurrencySymbolModel (symbol: "BRL", fullName: "Brazilian Real"),
            CurrencySymbolModel (symbol: "EUR", fullName: "Euro"),
            CurrencySymbolModel(symbol: "GBP", fullName: "British Pound Sterling"),
            CurrencySymbolModel (symbol: "JPY", fullName: "Japanese Yen"),
            CurrencySymbolModel (symbol: "USD", fullName: "United States Dollar")
        ]
        
        private let dataProvider: CurrencySymbolsDataProvider?
        
        
        init(dataProvider: CurrencySymbolsDataProvider = CurrencySymbolsDataProvider()){
            self.dataProvider = dataProvider
            self.dataProvider?.delegate = self
        }
        
        func doFetchCurrencySymbols(){
            dataProvider?.fetchSymbols()
        }
        
        nonisolated func success(model: [CurrencySymbolModel]) {
            DispatchQueue.main.async {
                // Realiza a chamada pro backend
               // self.currencySymbols = //model.sorted { $0.symbol < $1.symbol }
            }
        }
        
        
    }
}
