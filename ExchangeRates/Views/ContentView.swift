//
//  ContentView.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 21/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RatesFluctuationView()
        
        
        
//        VStack {
//            Button {
//                doFetchData()
//            } label: {
//                Image(systemName: "network")
//            }
//        }
//        .padding()
    }
    
//    private func doFetchData(){
////        let rateFluctuationDataProvider = RatesFluctuationDataProvider()
////        rateFluctuationDataProvider.delegate = self
////        rateFluctuationDataProvider.fetchFluctuation(by: "BRL", from:
////                                                        ["USD", "EUR"], startDate: "2022-10-11", endDate: "2022-11-11")
//
////        let rateSymbolDataProvider = CurrencySymbolsDataProvider()
////        rateSymbolDataProvider.delegate = self
////        rateSymbolDataProvider.fetchSymbols()
//
//        let rateHistoricalDataProvider = RatesHistoricalDataProvider()
//        rateHistoricalDataProvider.delegate = self
//        rateHistoricalDataProvider.fetchHistoricalRates(date: "2022-10-11", base: "USD", symbols: ["USD", "EUR"])
//    }
}

//extension ContentView: RatesFluctuationDataProviderDelegate {
//    func success (model: RatesFluctuationObject) {
//        print("RateFluctuationModel: \(model)\n\n")
//    }
//}
//extension ContentView: CurrencySymbolsDataProviderDelegate {
//    func success (model: CurrencySymbolObject) {
//        print ("RateSymbolDataProviderDelegate: \(model)\n\n" )
//    }
//}
//extension ContentView: RatesHistoricalDataProviderDelegate {
//    func success (model: RatesHistoricalObject){
//        print ("RateHistoricalModel: \(model)\n\n")
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
