//
//  Droppablepin.swift
//  pixel-city
//
//  Created by Ahmed on 7/1/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
import MapKit

class Droppablepin: NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var identifier : String
    init(coordinate:CLLocationCoordinate2D,identifier:String){
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
}
