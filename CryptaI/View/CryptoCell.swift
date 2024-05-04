//
//  CryptoCollectionViewCell.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import UIKit
import Kingfisher

class CryptoCell: UICollectionViewCell {
    
    static let identifier = "cryptoCell"
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var increaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(with coin: Coin) {
        nameLabel.text = coin.symbol
        titleLabel.text = coin.name
        
        if let iconURLString = coin.iconURL,
           let iconURL = URL(string: iconURLString) {
            coinImage.kf.setImage(with: iconURL)
        }
    }
}
