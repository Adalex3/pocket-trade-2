//
//  BumpVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit
import AVKit
import CoreMotion
import Alamofire
import CoreHaptics



class BumpVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var item: Item? = nil
    
    let hapticManager = HapticManager()
    var avPlayer = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.startAccelerometerUpdates()

        guard let path = Bundle.main.path(forResource: "bump", ofType: "mov") else {
            print("MOVIE NOT FOUND")
            return
        }
//
        let playerItem = AVPlayerItem(url: URL(fileURLWithPath: path))
        avPlayer = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        self.view.layer.sublayers?[0].backgroundColor = UIColor.clear.cgColor
        avPlayer.play()
        
        hapticManager.regenerate(0.8,successAtEnd: true)
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem, queue: .main) { [weak self] _ in
            self!.avPlayer.seek(to: CMTime.zero)
            self!.avPlayer.play()
            self?.hapticManager.regenerate(0.8,successAtEnd: true)
        }
        
        manager.startAccelerometerUpdates(to: .main) { (data, error) in
            // Handle acceleration updatev
            if(abs((data?.acceleration.x ?? 0.0)) > 2 || abs((data?.acceleration.y) ?? 0.0) > 2 || abs((data?.acceleration.z) ?? 0.0) > 2) {
                print("BUMP!")
                self.manager.stopAccelerometerUpdates()
                
                self.hapticManager.explode(duration: 2.0)
                self.avPlayer.pause()
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.playerLayer.opacity = 0.0
                })
                
                guard let path = Bundle.main.path(forResource: "explode", ofType: "gif") else {
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
                self.imageView.animationImages = images
                
                self.imageView.startAnimating()
                
                self.delay(0.5, completion: {
                    self.imageView.stopAnimating()
                })
                
                self.delay(0.75, completion: {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "meetupSuccessVC") as! MeetupSuccessVC
                    self.present(vc, animated: true)
                })
                
            }
        }
        
        textThirdParty()
        
        // Do any additional setup after loading the view.
    }
    
    let manager = CMMotionManager()

    
    func textThirdParty() {
        let accountSID = "AC13a5b63dbdccddbd3233b0fa07e10fe4"
        let authToken = "08c8562a7c80e1c7f213407a1c10f842"

        let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
        let parameters = ["From": "8665251701", "To": "9048590080", "Body": "Hey! This is Pocket Trade reaching out to let you know that your friend, Alex Hynds, will be Meeting Up to recieve a Trade momentarily. If they don't reach out to you within a few minutes to let you know all is well, you might want to check up on them. Have a great day!"]

        AF.request(url, method: .post, parameters: parameters)
            .authenticate(username: accountSID, password: authToken)
            .responseJSON { response in
                debugPrint(response)
//                RunLoop.main.run()
        }
    }
    
}
