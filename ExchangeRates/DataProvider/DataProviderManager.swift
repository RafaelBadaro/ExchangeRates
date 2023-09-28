//
//  DataProviderManager.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 26/09/23.
//

import Foundation

protocol DataProviderManageDelegate {
    func success(model: Any)
    func errorData(_ provider: DataProviderManageDelegate?, error: Error)
}

extension DataProviderManageDelegate {
    func success(model: Any){
        preconditionFailure("This method must be overriden")
    }
    
    func errorData(_ provider: DataProviderManageDelegate?, error: Error){
        print(error.localizedDescription)
    }
}


class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
