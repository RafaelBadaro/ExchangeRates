//
//  RatesApi.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 21/09/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct RatesApi{
    static let baseUrl = "http://api.exchangeratesapi.io/v1"
    static let apiKey = "5b92f281ab97ac5ffcaeec3675c3bef5"
    static let fluctuation = "/fluctuation"
    static let symbols = "/symbols"
    static let timeseries = "/timeseries"
}
