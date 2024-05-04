//
//  Double.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import Foundation

extension Double {
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static let percentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    func formattedPrice() -> String? {
        return Double.priceFormatter.string(from: NSNumber(value: self))
    }
    
    func formattedPercentage() -> String? {
        return Double.percentageFormatter.string(from: NSNumber(value: self))
    }
}
