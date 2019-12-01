//
//  DesignableSlider.swift
//  iMusic
//
//  Created by Felix Falkovsky on 01.12.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableSlider: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }

}
