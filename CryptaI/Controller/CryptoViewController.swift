//
//  CyrptoViewController.swift
//  CryptaI
//
//  Created by FFK on 3.05.2024.
//

import UIKit

class CryptoViewController: UIViewController {
    
    @IBOutlet weak var customView: CustomCardCell!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: CardCollectionCell.identifier)
    }
}

extension CryptoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.identifier, for: indexPath) as! CardCollectionCell
        return cell
    }
    
    
}
