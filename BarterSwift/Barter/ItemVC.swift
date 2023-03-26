//
//  ItemVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit
import CoreLocation

class ItemVC: UIViewController {
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    var panRecognizer: UIPanGestureRecognizer? = nil
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    var parentVC: MarketVC? = nil
    @IBOutlet weak var leftArrow: UIImageView!
    @IBOutlet weak var rightArrow: UIImageView!
    
    var item: Item? = nil

    @IBAction func mapButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mapVC") as! MapVC
        vc.item = item
        present(vc,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        gestureRecognizer.direction = .up
        panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
        
        self.view.addGestureRecognizer(gestureRecognizer)
        self.view.addGestureRecognizer(panRecognizer!)
        
        guard let path = Bundle.main.path(forResource: "swipeup", ofType: "gif") else {
            print("Gif does not exist at that path")
            return
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        leftArrow.animationImages = images
        rightArrow.animationImages = images
        
        leftArrow.startAnimating()
        rightArrow.startAnimating()
        
        showItem(item!)
        
    }
    
    @objc func swipe() {
        print("Swiped!")
    }
    
    @objc func pan() {
        let trans = (panRecognizer!.translation(in: self.view))
        self.view.layoutIfNeeded()
        heightConstraint.constant = 164-trans.y/2
        if(trans.y > 100.0) {
            parentVC!.dismiss(animated: true)
        } else if (trans.y < -100.0) {
            // SWIPE UP
            let vc = storyboard?.instantiateViewController(withIdentifier: "myItemsVC") as! MyItemsVC
            vc.barterItem = item
            vc.clickable = true
            vc.arrowShow = true
            present(vc,animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showItem(_ item: Item) {
        self.item = item
        
        name.text = item.name
        descr.text = item.description
        type.text = item.type
        distance.text = "\((round(CLLocation(latitude: 28.05884, longitude: 82.41548).distance(from: CLLocation(latitude: item.location!.latitude, longitude: item.location!.longitude))/1000)/10) * 10) km away"
        image.image = item.image ?? UIImage(named: "notfound")
        owner.text = item.owner
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        date.text = formatter.string(from: item.postDate ?? Date.distantPast)
    }

}

extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}
