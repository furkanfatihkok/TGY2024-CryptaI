//
//  DetailViewController.swift
//  CryptaI
//
//  Created by FFK on 3.05.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var customView: CustomCardCell!
    @IBOutlet weak var lineChartView: LineChartView!
    
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
        
        if let selectedCoin = selectedCoin, let sparklineStrings = selectedCoin.sparkline {
            var sparklineData: [Double] = []
            for string in sparklineStrings {
                if let doubleValue = Double(string) {
                    sparklineData.append(doubleValue)
                }
            }
            lineChartView.sparkline = sparklineData
        }
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
        textField.text = ""
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Collection View Delegate&DataSource

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
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
        
        if let filteredCoin = viewModel.filteredCoins?[indexPath.item] {
            cell.configure(with: filteredCoin)
        }
        
        return cell
    }
}

//MARK: - TextField Delegate

extension DetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        if updatedText.isEmpty || updatedText.count == 1 {
            filterContentForSearchText(updatedText)
        }
        return true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            viewModel.filteredCoins = viewModel.cryptoData?.data?.coins
        } else {
            viewModel.filteredCoins = viewModel.cryptoData?.data?.coins?.filter { coin in
                return coin.name!.lowercased().contains(searchText.lowercased())
            }
        }
        collectionView.reloadData()
    }
    
}
