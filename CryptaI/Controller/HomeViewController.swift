//
//  ViewController.swift
//  CryptaI
//
//  Created by FFK on 1.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        changeColor(itemAppearance: UITabBarItemAppearance())
        
        collectionView.register(UINib(nibName: "CryptoCell", bundle: nil), forCellWithReuseIdentifier: CryptoCell.identifier)
        
        viewModel.fetchData()
    }
    
    /*
     FONKSİYON İSMİNİ DEĞİŞTİR
     */
    
    private func setupTabBar() {
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.backgroundColor = UIColor.primaryBackground
        
        changeColor(itemAppearance: appearanceTabBar.stackedLayoutAppearance)
        changeColor(itemAppearance: appearanceTabBar.inlineLayoutAppearance)
        changeColor(itemAppearance: appearanceTabBar.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearanceTabBar
        tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar
    }
    
    private func changeColor(itemAppearance: UITabBarItemAppearance) {
        
        itemAppearance.selected.iconColor = UIColor.primaryPurple
        itemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.primaryPurple]
        
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
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

