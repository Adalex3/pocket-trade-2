//
//  ViewController.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit

var market: [Item] = []

class ViewController: UIViewController {

    @IBOutlet weak var topFence: UIImageView!
    @IBOutlet weak var topFenceHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomFenceHeight: NSLayoutConstraint!
    
    let hapticManager = HapticManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rotate top fence
        topFence.transform = topFence.transform.rotated(by: .pi)
        
        // Setup initial transforms
        topFenceHeight.constant = 1500
        bottomFenceHeight.constant = 128
        
        // Animate gates opening
        delay(0.1, completion: {
            self.topFenceHeight.constant = 64
            self.bottomFenceHeight.constant = 64
            self.hapticManager.whoosh(0.6,0.4)
            UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
                self.view.layoutIfNeeded()
            })
        })
        
//        FirestoreManager().fetchAllData()
//        Item.convertData(documents)
        
    }


}

