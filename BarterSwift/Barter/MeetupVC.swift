//
//  BumpViewController.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import UIKit
import NearbyInteraction
import CoreMotion
import MapKit

class MeetupVC: UIViewController {
    
    @IBAction func imhereButton(_ sender: Any) {
    }
    
    @IBAction func getDirections(_ sender: Any) {
        
        let latitude: CLLocationDegrees = 28.25926
        let longitude: CLLocationDegrees = 82.03556
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: options)
        
    }
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        manager.startAccelerometerUpdates()
//        while (true) {
//            update()
//        }
    }
    
}

//class BumpViewController: UIViewController, NISessionDelegate {
//
//    override func viewDidLoad() {
//        if #available(iOS 16.0, *) {
//            if NISession.deviceCapabilities.supportsDirectionMeasurement {
//                // Interact using device distance and direction.
//                print("YES!")
//            } else if NISession.deviceCapabilities.supportsPreciseDistanceMeasurement {
//                // Interact using distance only.
//                print("No :(")
//            }
//
//            let session = NISession()
//            session.delegate = self
//
//            let data = try! NSKeyedArchiver.archivedData(withRootObject: session.discoveryToken, requiringSecureCoding: true)
//
//            let peerDiscoverToken = (try! NSKeyedUnarchiver.unarchivedObject(ofClass: NIDiscoveryToken.self, from: data))!
//
//            let configuration = NINearbyPeerConfiguration(peerToken: peerDiscoverToken!)
//
//            configuration = try NINearbyAccessoryConfiguration(data: configData)
//
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        NearbyInteractionManager.instance.delegate = self
////        NearbyInteractionManager.instance.start()
////
////        print("HJDFSFLKDJKLFSJDKLFJSDKLFJl")
////
////    }
////
////    private func updateConnectedPersonFrame(object: NINearbyObject) {
//////            let size = connectedPersonContainer.frame.size
//////            let containerWidth = coordinateContainerView.frame.width
//////            let containerHeight = coordinateContainerView.frame.height
//////            let point = Point(distance: object.distance, direction: object.direction)
//////
//////            if let azimuth = point.azimuth, let elevation = point.elevation {
//////                let origin = CGPoint(x: (containerWidth / 2) + CGFloat(azimuth) * (containerWidth / 2),
//////                                     y: (containerHeight / 2) - CGFloat(elevation) * (containerHeight / 2))
//////                connectedPersonContainer.frame = .init(origin: .init(x: origin.x - size.width/2 , y: origin.y - size.height/2), size: size)
//////            }
////        print("Distance: \(object.distance)\nDirection:\(object.direction)\n\n")
////
////        }
////
////    /*
////    // MARK: - Navigation
////
////    // In a storyboard-based application, you will often want to do a little preparation before navigation
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destination.
////        // Pass the selected object to the new view controller.
////    }
////    */
//
//}
//
//extension BumpViewController: NearbyInteractionManagerDelegate {
//    func didUpdateNearbyObjects(objects: [NINearbyObject]) {
//        DispatchQueue.main.async { [weak self] in
//            guard let object = objects.first else { return }
//            self?.updateConnectedPersonFrame(object: object)
//        }
//    }
//}
