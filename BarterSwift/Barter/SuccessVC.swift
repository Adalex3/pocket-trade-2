//
//  SuccessVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import UIKit

class SuccessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        delay(2.0, completion: {
//            globalNav?.dismiss(animated: true)
//            globalNav?.popToRootViewController(animated: true)
//        })
//
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        delay(2.0, completion: {
            globalNav?.dismiss(animated: true)
            globalNav?.popToRootViewController(animated: true)
//        })
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
