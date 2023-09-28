//
//  CurrencyRouter.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 21/09/23.
//

import Foundation

enum CurrencyRouter{
    case symbols
    
    var path: String {
        switch self {
        case .symbols: return RatesApi.symbols
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesApi.baseUrl) else { return nil }
        
        url.append(queryItems: [
            URLQueryItem(name: "access_key", value: RatesApi.apiKey)
        ])
        
        switch self {
        case .symbols:
            var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
            request.httpMethod = HttpMethod.get.rawValue
            request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apikey") // nao precisa fazer isso
            return request
        }
    }
    
}
