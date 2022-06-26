//
//  ContentView.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import SwiftUI

struct FilmListView: View {
    
    @ObservedObject var filmListViewModel: FilmListViewModel
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.searchFilm(filmName: "titanic")
    }
    
    var body: some View {
        List(filmListViewModel.films, id: \.imdbID) { film in
            Text(film.title )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}

