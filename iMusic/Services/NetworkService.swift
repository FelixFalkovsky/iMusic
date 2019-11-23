//
//  NetworkService.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    
    func fetchTracks(searchText: String, competion: @escaping (SearchResponse?) -> Void) {
        
        let url = "https://itunes.apple.com/search"
        let parametrs = ["term":"\(searchText)", "limit":"100", "media":"music"]
            
            Alamofire.request(url, method: .get, parameters: parametrs, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
                if let error = dataResponse.error {
                    print("Error received requestion data: \(error.localizedDescription)")
                    competion(nil)
                    return
                }
                
                guard let data = dataResponse.data else { return }
                
                let decoder = JSONDecoder()
                do {
                    let objects = try decoder.decode(SearchResponse.self, from: data)
                    print("objects: ", objects)
                    competion(objects)
               
                    
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    competion(nil)
                }
                           
//                let someString = String(data: data, encoding: .utf8)
//                print(someString ?? "")
            }
        
    }
}
