//
//  CMTime + Extension.swift
//  iMusic
//
//  Created by Felix Falkovsky on 25.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import Foundation
import AVKit

extension CMTime {
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSecond = Int(CMTimeGetSeconds(self))
        let seconds = totalSecond % 60
        let minutes = totalSecond / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}
