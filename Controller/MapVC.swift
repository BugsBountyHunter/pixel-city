//
//  ViewController.swift
//  pixel-city
//
//  Created by Ahmed on 6/29/18.
//  Copyright © 2018 Ahmed. All rights reserved.

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController,UIGestureRecognizerDelegate {
    
    //Outlet
    @IBOutlet weak var mapView: MKMapView!
    // Var
    var locationManager = CLLocationManager()
    let authrizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius:Double = 100000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate=self
        locationManager.delegate = self
        mapView.mapType = .standard
        configureLocationServices()
        addDoubleTap()
        
    }
    
    func addDoubleTap(){
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(dropPin(sender:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        mapView.addGestureRecognizer(doubleTap)
    }
    //Action
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        if authrizationStatus == .authorizedAlways || authrizationStatus == .authorizedWhenInUse {
            centerMapOnUserClick()
        }
    }
    
}//end Class

    //MARK: Extension
    extension MapVC:MKMapViewDelegate{
        //CenterMapOnUserClick
        func centerMapOnUserClick(){
            guard let coordinate = locationManager.location?.coordinate else{
                    return print(" no available location ")
                }
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
                print("Hello")
            }
          //Action Function For UITapGestureRecognizer
        @objc func dropPin(sender:UITapGestureRecognizer){
            removePin()
            let touchPoint = sender.location(in: mapView)
            let touchCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            print("latitude:\(touchCoordinate.latitude) , longitude \(touchCoordinate.longitude)")
            let annotation = Droppablepin(coordinate: touchCoordinate, identifier: "droppablepin")
            mapView.addAnnotation(annotation)
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(touchCoordinate, regionRadius * 2.0 , regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
            
        }
        // Function Remove Pin
        func removePin(){
            for annotation in mapView.annotations{
                mapView.removeAnnotation(annotation)
            }
        }
        
            }


   extension MapVC:CLLocationManagerDelegate{
    func configureLocationServices(){
        if authrizationStatus == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }else{
                return
           }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserClick()
    }
    
  }




