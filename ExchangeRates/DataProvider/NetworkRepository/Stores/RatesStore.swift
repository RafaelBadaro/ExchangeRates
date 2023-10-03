//
//  RatesStore.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 25/09/23.
//

import Foundation

protocol RatesStoreProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String)
    async throws -> RatesFluctuationObject
    func fetchTimeseries(by base: String, from symbols: [String], startDate: String, endDate: String)
    async throws -> RatesHistoricalObject
    func fetchHistoricalRates(by date: String, base: String, from symbols: [String])
    async throws -> RatesHistoricalObject
}

class RatesStore: BaseStore, RatesStoreProtocol {

    
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String) async throws -> RatesFluctuationObject {
        guard let urlRequest = try RatesRouter.fluctuation(base: base, symbols: symbols, startDate: startDate, endDate: endDate).asUrlRequest() else {
            throw error
        }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let rates = try RateResult<RatesFluctuationObject>(data: data, response: response).rates else {
            throw error
        }
        
        return rates
    }
    
    func fetchTimeseries(by base: String, from symbol: [String], startDate: String, endDate: String) async throws -> RatesHistoricalObject {
        guard let urlRequest = try RatesRouter.timeseries(base: base, symbols: symbol, startDate: startDate, endDate: endDate).asUrlRequest() else {
            throw error
        }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let rates = try RateResult<RatesHistoricalObject>(data: data, response: response).rates else {
            throw error
        }
        
        return rates
    }
    
    func fetchHistoricalRates(by date: String, base: String, from symbols: [String]) async throws -> RatesHistoricalObject {
        guard let urlRequest = try RatesRouter.historicalRates(date: date, base: base, symbols: symbols).asUrlRequest() else {
            throw error
        }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let rates = try RateResult<RatesHistoricalObject>(data: data, response: response).rates else {
            throw error
        }
        
        return rates
    }
    
}
