//
//  SNSliderDataSource.swift
//  iOSPhotoEditor
//
//  Created by Anton Dolzhenko on 10.01.2018.
//
//

import UIKit

public protocol SNSliderDataSource : class {
    
    func numberOfSlides(_ slider: SNSlider) -> Int
    
    func slider(_ slider: SNSlider, slideAtIndex index: Int) -> SNFilter
    
    func startAtIndex(_ slider: SNSlider) -> Int
}

// MARK : - Extension Datasource

extension SNSliderDataSource {
    
    func numberOfSlides(_ slider: SNSlider) -> Int {
        
        return 3
    }
    
    func slider(_ slider: SNSlider, slideAtIndex index: Int) -> SNFilter {
        
        let filter = SNFilter(frame: slider.frame)
        switch index {
        case 0:
            filter.backgroundColor = UIColor.black
            return filter
        case 1:
            filter.backgroundColor = UIColor.green
            return filter
        case 2:
            filter.backgroundColor = UIColor.yellow
            return filter
        default:
            filter.backgroundColor = UIColor.yellow
            return filter
        }
    }
    
    func startAtIndex(_ slider: SNSlider) -> Int {
        return 0
    }
}
