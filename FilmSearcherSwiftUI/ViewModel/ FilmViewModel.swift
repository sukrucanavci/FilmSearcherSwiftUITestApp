//
//   FilmViewModel.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import Foundation
import SwiftUI

class FilmListViewModel: ObservableObject {
    
    @Published var films = [FilmViewModel]()
     
    let downloadClient = DownloaderClient()
    
    func searchFilm(filmName: String) {
        downloadClient.downloadFilms(search: filmName) { (result) in
            switch result {
            case .success(let filmArray):
                if let filmArray = filmArray {
                    DispatchQueue.main.async {
                        self.films = filmArray.map(FilmViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct FilmViewModel {
    
    let film: Film
    
    var title: String {
        film.title
    }
    
    var poster: String {
        film.poster
    }
    
    var year: String {
        film.year
    }
    
    var imdbID: String {
        film.imdbID
    }
    
}
