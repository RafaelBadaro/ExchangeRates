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
    static let symbols = "/symbols"
    static let latest = "/latest"
    static let convert = "/convert"
    static let timeseries = "/timeseries" // its paid
    static let fluctuation = "/fluctuation" // its paid



}
