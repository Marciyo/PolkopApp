//
//  MapViewController.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Find nearest items".localized

        self.loadMapView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMapView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate for Poznan
        let camera = GMSCameraPosition.camera(withLatitude: 52.4064, longitude: 16.9252, zoom: 13.0)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 52.4014, longitude: 16.9222)
        marker.title = "Koparka"
        marker.snippet = "P3129-123.c"
        marker.map = mapView
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 52.41064, longitude: 16.9352)
        marker1.title = "Koparka"
        marker1.snippet = "P3129-123.c"
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 52.4017, longitude: 16.9352)
        marker2.title = "Koparka"
        marker2.snippet = "P3129-123.c"
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 52.4104, longitude: 16.9452)
        marker3.title = "Koparka"
        marker3.snippet = "P3129-123.c"
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 52.4014, longitude: 16.9052)
        marker4.title = "Koparka"
        marker4.snippet = "P3129-123.c"
        marker4.map = mapView
    }
}
