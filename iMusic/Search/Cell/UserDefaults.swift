//
//  UserDefaults.swift
//  iMusic
//
//  Created by Felix Falkovsky on 30.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let favouriteTrackKey = "favouriteTrackKey"
    
    func savedTracks() -> [SearchViewModel.Cell]{
        let defaults = UserDefaults.standard
        
        guard let savedTracks = defaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell]
            else { return [] }
        return decodedTracks
    }
}
