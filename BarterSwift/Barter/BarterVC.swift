//
//  BarterVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import UIKit

class BarterVC: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myType: UILabel!
    @IBOutlet weak var barterType: UILabel!
    @IBOutlet weak var barterName: UILabel!
    @IBOutlet weak var barterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    var barterItem: Item? = nil
    var myItem: Item? = nil
    
    func setup() {
        
        print("barterItem \(barterItem!.name)")
        print("myItem \(myItem!.name)")
        
        barterName.text = barterItem!.name
        barterType.text = barterItem!.type
        
        barterImage.image = barterItem?.image
        
        
        myName.text = myItem?.name
        
        myType.text = myItem!.type
        
        myImage.image = myItem?.image
        
        
    }
    
}
