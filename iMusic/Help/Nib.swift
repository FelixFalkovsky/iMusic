//
//  Nib.swift
//  iMusic
//
//  Created by Felix Falkovsky on 26.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0]
        as! T
    }
}
