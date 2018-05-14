//
//  RGAnnotationView.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

// import MapKit

class RGAnnotation: NSObject, BMKAnnotation {    //MKAnnotation
    
    var coordinate: CLLocationCoordinate2D
    
    func updateCoordinate(newCoordinate: CLLocationCoordinate2D){
        
        coordinate = newCoordinate
    }
    
    
    init(coord coordinate_new: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: value_coordinates().lati, longitude: value_coordinates().longi)) {
        coordinate = coordinate_new
    }
    
}
