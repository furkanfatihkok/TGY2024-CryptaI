//
//  CardCollectionCell.swift
//  CryptaI
//
//  Created by FFK on 6.05.2024.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionCell"
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var cryptoNamelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with coin: Coin) {
        containerView.backgroundColor = UIColor.containerBackground
        containerView.layer.borderColor = UIColor.primaryPurple.cgColor
        containerView.layer.borderWidth = 0.3
        containerView.layer.cornerRadius = 4
        
        cryptoNamelLabel.text = coin.name
        descLabel.text = "\(coin.symbol ?? "") / TL"
        titleLabel.text = coin.symbol
        
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
