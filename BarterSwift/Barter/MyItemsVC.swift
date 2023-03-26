//
//  MyItemsVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import UIKit

class MyItemsVC: UICollectionViewController {
    
    var barterItem: Item? = nil
    var clickable = false
    var arrowShow = false

    override func viewDidLoad() {
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "celli")
        collectionView.backgroundColor = UIColor(named: "BG")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SampleMyItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "celli", for: indexPath) as! ItemCell
        cell.widthAnchor.constraint(equalToConstant: 344).isActive = true
        cell.showItem(SampleMyItems[indexPath.row])
        if(!arrowShow) {
            cell.arrowImage.makeInvisible()
            cell.arrowTrailing.constant = -86
            cell.layoutIfNeeded()
        }
        cell.roundCorners(16)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if clickable {
            let vc = storyboard?.instantiateViewController(withIdentifier: "barterVC") as! BarterVC
            vc.barterItem = barterItem
            vc.myItem = SampleMyItems[indexPath.row]
            present(vc, animated: true)
        }
    }

}
