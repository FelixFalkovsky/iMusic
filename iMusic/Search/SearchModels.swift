//
//  SearchModels.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright (c) 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getTracks
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentTracks
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayTracks
      }
    }
  }
  
}
