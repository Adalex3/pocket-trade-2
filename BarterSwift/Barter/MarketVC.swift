//
//  MarketVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit

class MarketVC: UICollectionViewController {
    
    override func viewDidLoad() {
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "celli")
        collectionView.backgroundColor = UIColor(named: "BG")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SampleMarket.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "celli", for: indexPath) as! ItemCell
        cell.widthAnchor.constraint(equalToConstant: 344).isActive = true
        cell.showItem(SampleMarket[indexPath.row])
        cell.roundCorners(16)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentItem(SampleMarket[indexPath.row])
    }
    
    func presentItem(_ item: Item) {
        print("Presenting \(item.name!)")
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "itemVC") as! ItemVC
        vc.parentVC = self
        vc.item = item
        present(vc, animated: true)
    }
    
}
