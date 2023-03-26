import UIKit
import CoreLocation

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var arrowTrailing: NSLayoutConstraint!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bigButton: UIButton!
    @IBAction func arrowButton(_ sender: Any) {
        print("ARROW BUTTON")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distanceView.roundCorners(16)
        distanceView.layer.masksToBounds = true
        distanceView.layer.borderColor = UIColor.black.cgColor
        distanceView.layer.borderWidth = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func showItem(_ item: Item) {
        title.text = item.name
        descriptionLabel.text = item.description
        type.text = item.type
        distance.text = "\((round(CLLocation(latitude: 28.05884, longitude: 82.41548).distance(from: CLLocation(latitude: item.location!.latitude, longitude: item.location!.longitude))/1000)/10) * 10) km away"
        image.image = item.image ?? UIImage(named: "notfound")
        owner.text = item.owner
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        postDate.text = formatter.string(from: item.postDate ?? Date.distantPast)
    }
    
}
