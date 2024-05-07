//
//  CryptoViewModel.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import Foundation

class CryptoViewModel {
    
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
    
    func sortCoinsByPrice() {
        cryptoData?.data?.coins?.sort { (coin1, coin2) -> Bool in
            guard let price1 = Double(coin1.price ?? "0"),
                  let price2 = Double(coin2.price ?? "0") else {
                return false
            }
            return price1 > price2
        }
        onDataUpdadate?()
    }
    
    func sortCoinsByVolume() {
        cryptoData?.data?.coins?.sort { (coin1, coin2) -> Bool in
            guard let volume1 = Double(coin1.the24HVolume ?? "0"),
                  let volume2 = Double(coin2.the24HVolume ?? "0") else {
                return false
            }
            return volume1 > volume2
        }
        onDataUpdadate?()
    }
    
    func sortCoinsByMarketCap() {
        cryptoData?.data?.coins?.sort { (coin1, coin2) -> Bool in
            guard let marketCap1 = Double(coin1.marketCap ?? "0"),
                  let marketCap2 = Double(coin2.marketCap ?? "0") else {
                return false
            }
            return marketCap1 > marketCap2
        }
        onDataUpdadate?()
    }
    
    func sortCoinsByChange() {
        cryptoData?.data?.coins?.sort { (coin1, coin2) -> Bool in
            guard let change1 = Double(coin1.change ?? "0"),
                  let change2 = Double(coin2.change ?? "0") else {
                return false
            }
            return change1 > change2
        }
        onDataUpdadate?()
    }
    
}
