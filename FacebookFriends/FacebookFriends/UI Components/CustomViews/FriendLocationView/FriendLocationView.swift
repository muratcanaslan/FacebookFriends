//
//  FriendLocationView.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit
import MapKit

final class FriendLocationView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    func configure(latitude: Double, longitude: Double) {
        let annotations = MKPointAnnotation()
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        annotations.coordinate = location
        annotations.title = "Location"
        
        mapView.addAnnotation(annotations)
        mapView.setCenter(location, animated: true)
        mapView.setRegion(region, animated: true)
        
    }
}
