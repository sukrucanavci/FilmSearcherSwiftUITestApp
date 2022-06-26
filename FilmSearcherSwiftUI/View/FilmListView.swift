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
        NavigationView {
            List(filmListViewModel.films, id: \.imdbID) { film in
                HStack {
                    CustomImage(url: film.poster)
                        .frame(width: 88, height: 128)
                    
                    VStack(alignment: .leading) {
                        Text(film.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        
                        Text(film.year)
                            .foregroundColor(.orange)
                    }
                }
            }.navigationTitle(Text("Films"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}

