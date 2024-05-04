//
//  CryptoViewModel.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import Foundation

final class CryptoViewModel {
    
    var cryptoData: CryptoModel?
    var errorMessage: String?
    
    var onDataUpdadate: (() -> Void)?
    
    func fetchData() {
        CryptoService.shared.fetchCryptoData { result in
            switch result {
            case .success(let data):
                self.cryptoData = data
                self.onDataUpdadate?()
            case.failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
