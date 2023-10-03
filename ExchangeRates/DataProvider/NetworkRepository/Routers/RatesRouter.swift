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
    case latest(base: String, symbols: [String])
    case historicalRates(date:String, base: String, symbols: [String])
    
    var path: String {
        switch self{
        case .fluctuation: return RatesApi.fluctuation
        case .timeseries: return RatesApi.timeseries
        case .latest: return RatesApi.latest
        case .historicalRates: return ""
            
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
        case .latest(base: let base, symbols: let symbols):
            url.append(queryItems: [
                URLQueryItem(name: "base", value: base),
                URLQueryItem(name: "symbols", value: symbols.joined(separator: ","))
            ])
        case .historicalRates(date: let date, base: let base, symbols: let symbols):
            var historicalRatesUrl = RatesApi.baseUrl
            historicalRatesUrl += "/"
            historicalRatesUrl += date
            historicalRatesUrl += "?access_key=\(RatesApi.apiKey)"
            historicalRatesUrl += "& base = \(base) & symbols = \(symbols.joined(separator: ","))"
            // O jeito que funciona eh passando dessa forma quebrada, usando o .append da o erro:
            /*
             {"error":{"code":"base_currency_access_restricted","message":"An unexpected error ocurred. [Technical Support: support@apilayer.com]"}}
             */
            
            guard var url2 = URL(string: historicalRatesUrl) else { return nil }
            

            
//            url2.append(queryItems: [
//                URLQueryItem(name: "access_key", value: RatesApi.apiKey),
//            ])
//            url2.append(queryItems: [
//                URLQueryItem(name: "base", value: base),
//                URLQueryItem(name: "symbols", value: symbols.joined(separator: ","))
//            ])
        
            var request = URLRequest(url: url2, timeoutInterval: Double.infinity)
            
            request.httpMethod = HttpMethod.get.rawValue
            request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apikey") // nao precisa fazer isso
            
            return request
        }

        var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
        
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apikey") // nao precisa fazer isso
        
        return request
    }
}
