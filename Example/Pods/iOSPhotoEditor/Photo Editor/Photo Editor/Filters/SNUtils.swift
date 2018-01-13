//
//  SNUtils.swift
//  iOSPhotoEditor
//
//  Created by Anton Dolzhenko on 10.01.2018.
//
//

import UIKit

open class SNUtils {
    
    open static let screenSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    // Allow you to take a screenshot of the screen
    open static func screenShot(_ view: UIView?) -> UIImage? {
        guard let imageView = view else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, true, 0.0)
        imageView.drawHierarchy(in: imageView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
