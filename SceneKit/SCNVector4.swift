//
//  SCNVector4.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import SceneKit

extension SCNVector4 {
    
    func inRadians() -> SCNVector3 {
        let x = self.w * self.x
        let y = self.w * self.y
        let z = self.w * self.z
        
        return SCNVector3Make(x, y, z)
    }
    
    func inDegrees() -> SCNVector3 {
        let radians = inRadians()
        let x = Int(degrees(fromRadians: radians.x))
        let y = Int(degrees(fromRadians: radians.y))
        let z = Int(degrees(fromRadians: radians.z))
        
        return SCNVector3Make(Float(x), Float(y), Float(z))
    }
    
    private func degrees(fromRadians radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    private func radians(fromDegrees degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
}
