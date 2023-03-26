//
//  Item.swift
//  Barter
//
//  Created by Alex Hynds on 3/25/23.
//

import Foundation
import CoreLocation
import UIKit
import Firebase
import FirebaseFirestore

class Item {

    var name: String?
    var type: String?
    var image: UIImage?
    
    var owner: String?
    var postDate: Date?
    var location: CLLocationCoordinate2D?
    var description: String?
    
    public init(name: String? = "TITLE", type: String? = "Knick-Knack", image: UIImage? = nil, owner: String = "OWNER", postDate: Date? = nil, location: CLLocationCoordinate2D? = nil, description: String? = "DESCRIPTION") {
        self.name = name
        self.type = type
        self.image = image
        self.owner = owner
        self.postDate = postDate
        self.location = location
        self.description = description
    }
    
    static func convertData(_ documents: [QueryDocumentSnapshot]) -> [Item] {
        print("CONVERT DATA HERE")
        var arr: [Item] = []
        for document in documents {
            print("CONVERT DATA HERE1")
            print(document.data())
        }
        return []
    }
    
}






var SampleMarket = [

    Item(name: "Plunger", type: "Knick-Knack", image: UIImage(named: "plunger"), owner: "Jerry He", postDate: Date(timeIntervalSince1970: 42492349234), location: CLLocationCoordinate2D(latitude: 28.25926, longitude: 82.03556), description: "This plunger is very plungerous. It has been used to plunge many toilets; however, it is still crystal clean and very clean. I think it is beautiful and you will too. Please take this off my hands; I can't deal with it any more."),
    
    Item(name: "21\" Monitor", type: "Tech", image: UIImage(named: "monitor"), owner: "Tom Cruise", postDate: Date(timeIntervalSince1970: 64492348732), location: CLLocationCoordinate2D(latitude: 27.99129, longitude: 82.44749), description: "This monitor is so large it is very good."),

    Item(name: "White Shirt", type: "Clothing", image: UIImage(named: "shirt"), owner: "Max", postDate: Date(timeIntervalSince1970: 95492363223), location: CLLocationCoordinate2D(latitude: 28.55199, longitude: 81.34368), description: "I'm not sure what to say about this shirt, other than it is white and is a shirt. It is a little wrinkly but that's only because I wore it while I was paragliding over the Everglades."),

    Item(name: "Water Bottle", type: "Knick-Knack", image: UIImage(named: "bottle"), owner: "Arjun", postDate: Date(timeIntervalSince1970: 864492349534), location: CLLocationCoordinate2D(latitude: 28.06778, longitude: 82.44124), description: "To hold water."),

]

var SampleMyItems = [

    Item(name: "Monster", type: "Music", image: UIImage(named: "monster"), owner: "Me", postDate: Date(timeIntervalSince1970: 42492435234), location: CLLocationCoordinate2D(latitude: 28.25954, longitude: 82.03563), description: "This drink will make you feel like you have sixteen eyes."),


]
