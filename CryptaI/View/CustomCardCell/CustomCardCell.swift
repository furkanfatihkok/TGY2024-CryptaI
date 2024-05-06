//
//  CustomCardCell.swift
//  CryptaI
//
//  Created by FFK on 6.05.2024.
//

import UIKit

class CustomCardCell: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinTitleLabel: UILabel!
    @IBOutlet weak var coinPriceLabel: UILabel!
    @IBOutlet weak var coinPercentageLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNibView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNibView()
    }
    
    private func loadViewFromNib() -> UIView? {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
    
    func configureNibView() {
        guard let view = self.loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configure(with coin: Coin) {
        containerView.backgroundColor = UIColor.containerBackground
        containerView.layer.borderColor = UIColor.primaryPurple.cgColor
        containerView.layer.borderWidth = 0.3
        containerView.layer.cornerRadius = 4
        
        coinNameLabel.text = coin.symbol
        coinTitleLabel.text = coin.name
        
        if let price = Double(coin.price!), let formattedPrice = price.formattedPrice() {
            coinPriceLabel.text = formattedPrice
        } else {
            coinPriceLabel.text = coin.price
        }
        
        if let changePercentage = Double(coin.change!), let formattedChange = changePercentage.formattedPercentage() {
            coinPercentageLabel.text = formattedChange
            if changePercentage < 0 {
                coinPercentageLabel.textColor = .red
            } else {
                coinPercentageLabel.textColor = .green
            }
        } else {
            coinPercentageLabel.text = coin.change
            coinPercentageLabel.textColor = .black
        }
        
        guard var urlString = coin.iconUrl else { return }
        
        if urlString.contains("svg") {
            urlString = urlString.replacingOccurrences(of: "svg", with: "png")
        }
        let url = URL(string: urlString)
        self.coinImage.sd_setImage(with: url, placeholderImage: UIImage(systemName: "questionmark"), context: nil)
    }
}
