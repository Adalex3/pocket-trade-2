//
//  CustomNav.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit

var globalNav: UINavigationController? = nil

class CustomNav: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        globalNav = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
