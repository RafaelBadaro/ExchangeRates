//
//  RatesRouter.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 21/09/23.
//

import Foundation

enum RatesRouter{
    case fluctuation(base: String, symbols: [String], startDate: String, endDate: String)
    case timeseries(base: String, symbols: [String], startDate: String, endDate: String)
    
    var path: String {
        switch self{
        case .fluctuation: return RatesApi.fluctuation
        case .timeseries: return RatesApi.timeseries
        }
    }
    
    

    func asUrlRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesApi.baseUrl) else { return nil }
        
        url.append(queryItems: [
            URLQueryItem(name: "access_key", value: RatesApi.apiKey),
        ])
        
        switch self {
            
        case .fluctuation(base: let base, symbols: let symbols, startDate: let startDate, endDate: let endDate):
            url.append(queryItems: [
                URLQueryItem(name: "base", value: base),
                URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                URLQueryItem(name: "start_date", value: startDate),
                URLQueryItem(name: "end_date", value: endDate)
            ])
        case .timeseries(base: let base, symbols: let symbols, startDate: let startDate, endDate: let endDate):
            url.append(queryItems: [
                URLQueryItem(name: "base", value: base),
                URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                URLQueryItem(name: "start_date", value: startDate),
                URLQueryItem(name: "end_date", value: endDate)
            ])
        }
        
        var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
        
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apikey") // nao precisa fazer isso
        
        return request
    }
}
