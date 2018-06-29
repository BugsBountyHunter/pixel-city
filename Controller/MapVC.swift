//
//  ViewController.swift
//  pixel-city
//
//  Created by Ahmed on 6/29/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    //Outlet
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate=self
        
    }
    
    //Action
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        
    }
    
    
}

extension MapVC:MKMapViewDelegate{
    
}

