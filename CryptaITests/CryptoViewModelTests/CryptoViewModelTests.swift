//
//  CryptoViewModelTests.swift
//  CryptaITests
//
//  Created by FFK on 7.05.2024.
//

import XCTest
@testable import CryptaI

final class CryptoViewModelTests: XCTestCase {
    
    var viewModel: CryptoViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CryptoViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testSortCoinsByMarketCap() {
        // Given
        let coin1 = Coin(symbol: "BTC", name: "Bitcoin", iconUrl: "", marketCap: "100000000000", price: "50000", change: "1", rank: 1, sparkline: nil, lowVolume: false, coinrankingURL: "", the24HVolume: "5000000", btcPrice: "1")
        
        let coin2 = Coin(symbol: "ETH", name: "Ethereum", iconUrl: "", marketCap: "80000000000", price: "3000", change: "0.5", rank: 2, sparkline: nil, lowVolume: false, coinrankingURL: "", the24HVolume: "3000000", btcPrice: "0.06")
        
        let coin3 = Coin(symbol: "ADA", name: "Cardano", iconUrl: "", marketCap: "40000000000", price: "2", change: "-0.2", rank: 3, sparkline: nil, lowVolume: false, coinrankingURL: "", the24HVolume: "1000000", btcPrice: "0.00004")
        
        // When
        viewModel.cryptoData = CryptoModel(data: DataClass(stats: nil, coins: [coin1, coin2, coin3]))
        
        // Then
        XCTAssertEqual(viewModel.cryptoData?.data?.coins?[0].symbol, "BTC")
    }
}
