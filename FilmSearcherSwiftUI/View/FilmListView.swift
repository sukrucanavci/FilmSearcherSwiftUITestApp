//
//  ContentView.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import SwiftUI

struct FilmListView: View {
    
    @ObservedObject var filmListViewModel: FilmListViewModel
    
    @State var searchText = ""
    
    init() {
        self.filmListViewModel = FilmListViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search film...", text: $searchText, onCommit: {
                    self.filmListViewModel.searchFilm(filmName: searchText
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                        .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText
                    )
                }).padding()
                    .textFieldStyle(.roundedBorder)
                
                List(filmListViewModel.films, id: \.imdbID) { film in
                    NavigationLink {
                        DetailView(imdbID: film.imdbID)
                    } label: {
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
                    }

                }.navigationTitle(Text("Films"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}

