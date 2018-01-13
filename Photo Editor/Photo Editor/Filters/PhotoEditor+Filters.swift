//
//  PhotoEditor+Filters.swift
//  iOSPhotoEditor
//
//  Created by Anton Dolzhenko on 10.01.2018.
//

import UIKit

extension PhotoEditorViewController {
    
    func setupSlider() {
        self.data = SNFilter.generateFilters(SNFilter(frame: self.slider.frame, withImage: image!), filters: SNFilter.filterNameList)
        
        self.slider.dataSource = self
        self.slider.isUserInteractionEnabled = true
        self.slider.isMultipleTouchEnabled = true
        self.slider.isExclusiveTouch = false
        
//        self.screenView.addSubview(slider)
        self.canvasView.insertSubview(slider, belowSubview: canvasImageView)
        let leftConstraint = NSLayoutConstraint(item: slider,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: canvasView,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: slider,
                                                attribute: .trailing,
                                                relatedBy: .equal,
                                                toItem: canvasView,
                                                attribute: .trailing,
                                                multiplier: 1.0,
                                                constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: slider,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: canvasView,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: slider,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: canvasView,
                                                attribute: .bottom,
                                                multiplier: 1.0,
                                                constant: 0.0)
        self.slider.reloadData()
        self.view.addConstraints([leftConstraint,rightConstraint,topConstraint,bottomConstraint])
    }
    
}

extension PhotoEditorViewController: SNSliderDataSource {
    
    public func numberOfSlides(_ slider: SNSlider) -> Int {
        return data.count
    }
    
    public func slider(_ slider: SNSlider, slideAtIndex index: Int) -> SNFilter {
        
        return data[index]
    }
    
    public func startAtIndex(_ slider: SNSlider) -> Int {
        return 0
    }
}
