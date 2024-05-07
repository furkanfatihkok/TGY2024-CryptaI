//
//  HomeViewController.swift
//  CryptaI
//
//  Created by FFK on 1.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var totalInfoLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var infoPriceButton: UIButton!
    
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var marketCapButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    
    let viewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalInfoLabel.text = ""
        statsLabel.text = ""
        infoPriceButton.isHidden = true
        
        setupUI()
        setupCollectionView()
        fetchDataAndUpdateUI()
        setLayerStyles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToDetail" {
            if let detailVC = segue.destination as? DetailViewController,
               let indexPath = collectionView.indexPathsForSelectedItems?.first,
               let selectedCoin = viewModel.cryptoData?.data?.coins?[indexPath.item] {
                detailVC.selectedCoin = selectedCoin
            }
        }
    }
    
    private func fetchDataAndUpdateUI() {
        viewModel.onDataUpdadate = { [weak self] in
            self?.collectionView.reloadData()
            self?.mainCoinsInfo()
        }
        viewModel.fetchData()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: CryptoCell.identifier, bundle: nil), forCellWithReuseIdentifier: CryptoCell.identifier)
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
    
    private func mainCoinsInfo() {
        let totalCoins = viewModel.cryptoData?.data?.stats?.totalCoins ?? 0
        
        totalInfoLabel.text = "Total Coins"
        statsLabel.text = String(format: "%.3f", Double(totalCoins) / 1000)
    }
    
    private func updatePriceLabel() {
        let totalMarket = viewModel.cryptoData?.data?.stats?.totalMarkets ?? 0
        
        totalInfoLabel.text = "Total Markets"
        statsLabel.text = String(format: "%.3f", Double(totalMarket) / 1000)
        
        infoPriceButton.isHidden = true
    }
    
    private func updateVolumeLabel() {
        if let totalVolumeString = viewModel.cryptoData?.data?.stats?.total24HVolume,
           let totalVolumeLabel = Double(totalVolumeString) {
            statsLabel.text = totalVolumeLabel.formattedPrice()!
        } else {
            statsLabel.text = "24h Volume not available"
        }
        totalInfoLabel.text = "Total 24h Volume"
        infoPriceButton.isHidden = false
        infoPriceButton.titleLabel?.text = "₺"
        infoPriceButton.titleLabel?.font = UIFont.latoRegular(ofSize: 17)
    }
    
    private func updateMarketCapLabel() {
        if let totalMarketCapString = viewModel.cryptoData?.data?.stats?.totalMarketCap,
           let totalMarketCap = Double(totalMarketCapString) {
            statsLabel.text = totalMarketCap.formattedPrice()!
        } else {
            statsLabel.text = "Market Cap not available"
        }
        totalInfoLabel.text = "Total Market Cap"
        infoPriceButton.isHidden = false
        infoPriceButton.titleLabel?.text = "₺"
        infoPriceButton.titleLabel?.font = UIFont.latoRegular(ofSize: 17)
    }
    
    private func updateChangeLabel() {
        let totalUpdate = viewModel.cryptoData?.data?.stats?.totalExchanges
        
        statsLabel.text = "\(totalUpdate ?? 0)"
        
        totalInfoLabel.text = "Total Exchanges"
        infoPriceButton.isHidden = false
        infoPriceButton.titleLabel?.text = "%"
        infoPriceButton.titleLabel?.font = UIFont.latoRegular(ofSize: 17)
    }
    
    @IBAction func priceButtonAction(_ sender: UIButton) {
        viewModel.sortCoinsByPrice()
        collectionView.reloadData()
        
        updatePriceLabel()
        
        priceButton.backgroundColor = UIColor.primaryPurple
        volumeButton.backgroundColor = .clear
        changeButton.backgroundColor = .clear
        marketCapButton.backgroundColor = .clear
    }
    
    @IBAction func timeButtonAction(_ sender: UIButton) {
        viewModel.sortCoinsByVolume()
        collectionView.reloadData()
        
        updateVolumeLabel()
        
        priceButton.backgroundColor = .clear
        volumeButton.backgroundColor = UIColor.primaryPurple
        marketCapButton.backgroundColor = .clear
        changeButton.backgroundColor = .clear
    }
    
    @IBAction func marketCapButtonAction(_ sender: UIButton) {
        viewModel.sortCoinsByMarketCap()
        collectionView.reloadData()
        
        updateMarketCapLabel()
        
        priceButton.backgroundColor = .clear
        volumeButton.backgroundColor = .clear
        marketCapButton.backgroundColor = UIColor.primaryPurple
        changeButton.backgroundColor = .clear
    }
    
    @IBAction func changeButtonAction(_ sender: UIButton) {
        viewModel.sortCoinsByChange()
        collectionView.reloadData()
        
        updateChangeLabel()
        
        priceButton.backgroundColor = .clear
        volumeButton.backgroundColor = .clear
        marketCapButton.backgroundColor = .clear
        changeButton.backgroundColor = UIColor.primaryPurple
    }

    private func setLayerStyles() {
        priceButton.backgroundColor = UIColor.primaryPurple
        priceButton.layer.borderColor = UIColor.primaryPurple.cgColor
        priceButton.layer.borderWidth = 0.5
        priceButton.layer.cornerRadius = 6
        
        volumeButton.layer.borderColor = UIColor.primaryPurple.cgColor
        volumeButton.layer.borderWidth = 0.5
        volumeButton.layer.cornerRadius = 6
        
        marketCapButton.layer.borderColor = UIColor.primaryPurple.cgColor
        marketCapButton.layer.borderWidth = 0.5
        marketCapButton.layer.cornerRadius = 6
        
        changeButton.layer.borderColor = UIColor.primaryPurple.cgColor
        changeButton.layer.borderWidth = 0.5
        changeButton.layer.cornerRadius = 6
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "homeToDetail", sender: viewModel.cryptoData?.data?.coins?[indexPath.item])
        
    }
    
}

