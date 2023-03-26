//
//  MapVC.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import UIKit
import CoreLocation
import MapKit

class MapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var map: MKMapView!
    var locationManager: CLLocationManager!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        map.showsUserLocation = true

        if (CLLocationManager.locationServicesEnabled())
                {
                    locationManager = CLLocationManager()
                    locationManager.delegate = self
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    locationManager.requestAlwaysAuthorization()
                    locationManager.startUpdatingLocation()
                }
            
        showItem(item!)
        
        map.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item!.location!.latitude, longitude: item!.location!.latitude), latitudinalMeters: CLLocationDistance(2000), longitudinalMeters: CLLocationDistance(2000))
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        label.text = "\(item?.owner ?? "OWNER") is approximately " + "\((round(CLLocation(latitude: 28.05884, longitude: 82.41548).distance(from: CLLocation(latitude: item!.location!.latitude, longitude: item!.location!.longitude))/1000)/10) * 10) km away"
        
        
    }
    
    public func showItem(_ item: Item) {
        print("HERE WITH ITEM \(item)")
        self.showCircle(coordinate: CLLocationCoordinate2D(latitude: item.location!.latitude, longitude: item.location!.latitude), radius: CLLocationDistance(1000), mapView: map)
    }
    
    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, mapView: MKMapView) {
            let circle = MKCircle(center: coordinate, radius: radius)
        mapView.addOverlay(circle)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        print("HERHEHRERHERHERHEh")
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = .blue
        circleRenderer.alpha = 0.2
        
        return circleRenderer
        }

}
