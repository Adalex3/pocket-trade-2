//
//  MeetupSuccessVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import UIKit
import MessageUI

class MeetupSuccessVC: UIViewController, MFMessageComposeViewControllerDelegate {
    
    var item: Item? = nil
    @IBAction func textButton(_ sender: Any) {
        let mvc = MFMessageComposeViewController()
        
        mvc.body = "Just sending you a quick text to let you know that I made my Trade, and I am safe! I hope you gave a great day!"
        mvc.recipients = ["9048590080"]
        mvc.messageComposeDelegate = self
        
        self.present(mvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        delay(2.0, completion: {
            globalNav?.dismiss(animated: true)
            globalNav?.popToRootViewController(animated: true)
//        })
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
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
