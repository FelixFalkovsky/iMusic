//
//  SearchResponse.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import Foundation


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworUrl100: String?
}
