//
//  CryptoCell.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import UIKit
import SDWebImage

class CryptoCell: UICollectionViewCell {
    
    static let identifier = "CryptoCell"
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(with coin: Coin) {
        
        nameLabel.text = coin.symbol
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
        
        guard var urlString = coin.iconUrl else { return }
        
        if urlString.contains("svg") {
            urlString = urlString.replacingOccurrences(of: "svg", with: "png")            
        }
        let url = URL(string: urlString)
        self.coinImage.sd_setImage(with: url, placeholderImage: UIImage(systemName: "questionmark"), context: nil)
    }
}

