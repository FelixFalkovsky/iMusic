//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright (c) 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
  
    
    switch response {
        
                            
    case .some:
        print("presenter .some")
    case .presentTracks:
        print("presenter .presenterTracks")
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
    }
    
  }
  
}
