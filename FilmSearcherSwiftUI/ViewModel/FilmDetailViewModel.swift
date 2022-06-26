//
//  FilmDetailViewModel.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 27.06.2022.
//

import Foundation
import SwiftUI

class FilmDetailViewModel: ObservableObject {
    
    @Published var filmDetail: FilmDetailsViewModel?
    
    let downloadClient = DownloaderClient()
    
    func getFilmDetail(imdbID: String) {
        
        downloadClient.downloadFilmDetail(imdbID: imdbID) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.filmDetail = FilmDetailsViewModel(detail: success!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct FilmDetailsViewModel {
    
    let detail: FilmDetail
    
    var title: String {
        detail.title
    }
    
    var poster: String {
        detail.poster
    }
    
    var year: String {
        detail.year
    }
    
    var imdbID: String {
        detail.imdbID
    }
    
    var director: String {
        detail.director
    }
    
    var writer: String {
        detail.writer
    }
    
    var awards: String {
        detail.awards
    }
    
    var plot: String {
        detail.plot
    }
}
