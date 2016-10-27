//
//  UIImageExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-24.
//  Copyright © 2016 Yung Dai. All rights reserved.
//


import UIKit

extension UIImage {
    
    class func takeScreenshot(view: UIView) -> UIImage? {
        
        // Create screenshot
        UIGraphicsBeginImageContext(view.bounds.size)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        print("Taking Screenshot")
        
        UIGraphicsEndImageContext()
        return screenshot
    }
    
}
