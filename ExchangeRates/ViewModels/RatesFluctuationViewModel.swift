//
//  RatesFluctuationViewModel.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 16/10/23.
//

import Foundation
import SwiftUI

extension RatesFluctuationView {
    @MainActor class ViewModel: ObservableObject, RatesFluctuationDataProviderDelegate {
        @Published var ratesFluctuation: [RateFluctuationModel] = [
            RateFluctuationModel(symbol: "USD", change: 0.0008, changePct: 0.4175,
                        endRate: 0.18857),
            RateFluctuationModel(symbol: "EUR", change: 0.0003, changePct: 0.1651,
                        endRate: 0.181353),
            RateFluctuationModel(symbol: "GBP", change: -0.0001, changePct: -0.0403,
                        endRate: 0.158915)
        ]
        
        @Published var timeRange = TimeRangeEnum.today
        @Published var baseCurrency = "BRL"
        @Published var currencies = [String]()
        
        private let dataProvider: RatesFluctuationDataProvider?
        
        init( dataProvider: RatesFluctuationDataProvider = RatesFluctuationDataProvider() ) {
            self.dataProvider = dataProvider
            self.dataProvider?.delegate = self
        }
        
        func doFetchRatesFluctuation(timeRange: TimeRangeEnum){
            withAnimation {
                self.timeRange = timeRange
            }
            
            let startDate = timeRange.date
            let endDate = Date()
            
            dataProvider?.fetchFluctuation(by: baseCurrency, from: currencies, startDate: startDate.toString(), endDate: endDate.toString())
        }
        
        nonisolated func success(model: [RateFluctuationModel]) {
            DispatchQueue.main.async {
                withAnimation {
                    //self.ratesFluctuation = model.sorted { $0.symbol < $1.symbol }
                }
            }
        }
        
    }

}
