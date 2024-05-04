//
//  CryptoModel.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import Foundation

struct CryptoModel: Decodable {
    let data: DataClass?
}

struct DataClass: Decodable {
    let stats: Stats?
    let coins: [Coin]?
}

struct Coin: Decodable {
    let symbol, name: String?
    let iconURL: String?
    let marketCap, price: String?
    let change: String?
    let rank: Int?
    let sparkline: [String]?
    let lowVolume: Bool?
    let coinrankingURL: String?
    let the24HVolume, btcPrice: String?

    enum CodingKeys: String, CodingKey {
        case symbol, name
        case iconURL
        case marketCap, price, change, rank, sparkline, lowVolume
        case coinrankingURL
        case the24HVolume
        case btcPrice
    }
}

struct Stats: Decodable {
    let total, totalCoins, totalMarkets, totalExchanges: Int?
    let totalMarketCap, total24HVolume: String?

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume
    }
}

