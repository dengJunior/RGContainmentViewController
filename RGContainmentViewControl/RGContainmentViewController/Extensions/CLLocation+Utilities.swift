//
//  CLLocation+Utilities.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation

extension CLLocation{
    
    func antipode() -> CLLocation{
        var newLatitude: CLLocationDegrees!
        var newLongitude: CLLocationDegrees!
        
        var longitudeCorrection: Double = -180.0
        if self.coordinate.longitude < 0.0{
            longitudeCorrection *= -1.0
        }
        newLatitude = coordinate.latitude * -1.0
        newLongitude = coordinate.longitude + longitudeCorrection;
        
        let antipode_location = CLLocation(latitude: newLatitude, longitude: newLongitude)
        
        return antipode_location
    }
    
}



