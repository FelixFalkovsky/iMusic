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
    case .presentTracks(let searchResults):
        let cells = searchResults?.results.map({ (track) in
            cellViewModel(from: track)
        }) ?? []
        
        let searchViewModel = SearchViewModel.init(cells: cells)
        print("presenter .presenterTracks")
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchViewModel))
    }
    
  }
    
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        return SearchViewModel.Cell.init(iconUrlString: track.artworUrl100,
                                         trackName: track.trackName,
                                         collectionName: track.collectionName ?? "",
                                         artistName: track.artistName)
    }
  
}
