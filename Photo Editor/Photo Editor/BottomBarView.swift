//
//  BottomBarView.swift
//  Photo Editor
//
//  Created by Anton Dolzhenko on 12.03.2018.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import UIKit

final class BottomBarView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
    
}
