//
//  DetailViewController.swift
//  CryptaI
//
//  Created by FFK on 3.05.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var customView: CustomCardCell!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    let viewModel = CryptoViewModel()
    
    var selectedCoin: Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.clearButtonMode = .never
        
        customView.configure(with: selectedCoin ?? MockData.bitcoin)
        setupCollectionView()
        fetchData()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: CardCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CardCollectionCell.identifier)
    }
    
    private func fetchData() {
        viewModel.fetchData()
        viewModel.onDataUpdadate = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    @IBAction func searchButton(_ sender: UIButton) {
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - CollectionView Protocol

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cryptoData?.data?.coins?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.identifier, for: indexPath) as?  CardCollectionCell else {
            fatalError("Unkown: CardCollectionCell")
        }
        if let coin = viewModel.cryptoData?.data?.coins?[indexPath.item] {
            cell.configure(with: coin)
        }
        
        return cell
    }
}

//MARK: - TextField Delegate

extension DetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
