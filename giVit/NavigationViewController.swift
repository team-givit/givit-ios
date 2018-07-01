//
//  NavigationViewController.swift
//  giVit
//
//  Created by Megnath Ramesh on 2018-06-30.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit
import GoogleMaps

class NavigationViewController:UIViewController{
    
    
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate
        let camera = GMSCameraPosition.camera(withLatitude: 53.32, longitude: -113.29, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.isMyLocationEnabled = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = mapView.myLocation != nil ? mapView.myLocation!.coordinate : CLLocationCoordinate2D(latitude: 53.32, longitude: -113.29)
        marker.title = "Edmonton"
        marker.snippet = "Canada"
        marker.map = mapView
    }
}
