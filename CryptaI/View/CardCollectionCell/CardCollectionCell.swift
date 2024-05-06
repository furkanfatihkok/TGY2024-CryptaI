//
//  CardCollectionCell.swift
//  CryptaI
//
//  Created by FFK on 6.05.2024.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionCell"
    
    @IBOutlet weak var cryptoNamelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with coin: Coin) {
        cryptoNamelLabel.text = coin.name
        titleLabel.text = coin.name
        
        if let price = Double(coin.price!), let formattedPrice = price.formattedPrice() {
            priceLabel.text = formattedPrice
        } else {
            priceLabel.text = coin.price
        }
        
        if let changePercentage = Double(coin.change!), let formattedChange = changePercentage.formattedPercentage() {
            percentageLabel.text = formattedChange
            if changePercentage < 0 {
                percentageLabel.textColor = .red
            } else {
                percentageLabel.textColor = .green
            }
        } else {
            percentageLabel.text = coin.change
            percentageLabel.textColor = .black
        }
    }
    
}
