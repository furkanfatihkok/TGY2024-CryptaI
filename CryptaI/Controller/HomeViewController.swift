//
//  HomeViewController.swift
//  CryptaI
//
//  Created by FFK on 1.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var marketCapLabel: UILabel!
    
    @IBOutlet weak var assetsLabel: UIButton!
    @IBOutlet weak var hoursLabel: UIButton!
    @IBOutlet weak var tradedLabel: UIButton!
    @IBOutlet weak var gainedLabel: UIButton!
    
    
    let viewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        fetchDataAndUpdateUI()
        setLayerStyles()
    }
    
    private func setupUI() {
        setupTabBarAppearance()
    }
    
    private func setupTabBarAppearance() {
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.backgroundColor = UIColor.appBackgroundColor
        changeColor(appearanceTabBar.stackedLayoutAppearance)
        changeColor(appearanceTabBar.inlineLayoutAppearance)
        changeColor(appearanceTabBar.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearanceTabBar
        tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar
    }
    
    private func changeColor(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = UIColor.primaryPurple
        itemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.primaryPurple]
        
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "CryptoCell", bundle: nil), forCellWithReuseIdentifier: CryptoCell.identifier)
    }
    
    private func fetchDataAndUpdateUI() {
        viewModel.onDataUpdadate = { [weak self] in
            self?.collectionView.reloadData()
            self?.updateMarketCapLabel()
        }
        viewModel.fetchData()
    }
    
    private func updateMarketCapLabel() {
        if let totalMarketCapString = viewModel.cryptoData?.data?.stats?.totalMarketCap,
           let totalMarketCap = Double(totalMarketCapString) {
            marketCapLabel.text = totalMarketCap.formattedPrice()!
        } else {
            marketCapLabel.text = "Market Cap not available"
        }
        
    }
    
    private func setLayerStyles() {
        assetsLabel.backgroundColor = UIColor.primaryPurple
        assetsLabel.layer.cornerRadius = 6
        
        hoursLabel.layer.borderColor = UIColor.primaryPurple.cgColor
        hoursLabel.layer.borderWidth = 0.5
        hoursLabel.layer.cornerRadius = 6
        
        tradedLabel.layer.borderColor = UIColor.primaryPurple.cgColor
        tradedLabel.layer.borderWidth = 0.5
        tradedLabel.layer.cornerRadius = 6
        
        gainedLabel.layer.borderColor = UIColor.primaryPurple.cgColor
        gainedLabel.layer.borderWidth = 0.5
        gainedLabel.layer.cornerRadius = 6
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cryptoData?.data?.coins?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoCell.identifier, for: indexPath) as? CryptoCell else {
            fatalError("Unkown: CryptoCell")
        }
        if let coin = viewModel.cryptoData?.data?.coins?[indexPath.item] {
            cell.configure(with: coin)
        }
        return cell
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        <#code#>
    //    }
    //
    
    
}

