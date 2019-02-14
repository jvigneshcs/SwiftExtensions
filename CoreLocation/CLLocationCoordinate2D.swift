//
//  CLLocationCoordinate2D.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
    
    func center(withRespectTo locationCoordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let longitude1 = longitude * Double.pi / 180
        let longitude2 = locationCoordinate.longitude * Double.pi / 180
        let latitude1 = latitude * Double.pi / 180
        let latitude2 = locationCoordinate.latitude * Double.pi / 180
        let deltaLongitude = longitude2 - longitude1
        let x = cos(latitude2) * cos(deltaLongitude)
        let y = cos(latitude2) * sin(deltaLongitude)
        
        let centerLatitude = atan2( sin(latitude1) + sin(latitude2), sqrt((cos(latitude1) + x) * (cos(latitude1) + x) + y * y) )
        let centerLongitude = longitude1 + atan2(y, cos(latitude1) + x)
        
        let center:CLLocationCoordinate2D = CLLocationCoordinate2DMake(centerLatitude * 180 / Double.pi, centerLongitude * 180 / Double.pi)
        return center
    }
}
