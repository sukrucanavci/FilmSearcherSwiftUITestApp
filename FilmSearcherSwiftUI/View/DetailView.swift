//
//  DetailView.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 27.06.2022.
//

import SwiftUI

struct DetailView: View {
    
    let imdbID: String
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            
            HStack{
                Spacer()
                
                CustomImage(url: filmDetailViewModel.filmDetail?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.2, alignment: .center)
                
                Spacer()
            }
            
            Text(filmDetailViewModel.filmDetail?.title ?? "Film's title will be show")
                .font(.title)
                .padding()
            
            Text(filmDetailViewModel.filmDetail?.plot ?? "Film's plot will be show")
                .padding()
            
            Text("Director: \(filmDetailViewModel.filmDetail?.director ?? "Director will be show")")
                .padding()
            
            Text("Writer: \(filmDetailViewModel.filmDetail?.writer ?? "Writer will be show")")
                .padding()
            
            Text("Awards: \(filmDetailViewModel.filmDetail?.awards ?? "Awards will be show")")
                .padding()
            
            Text("Year: \(filmDetailViewModel.filmDetail?.year ?? "Year will be show")")
                .padding()
            
        }.onAppear {
            self.filmDetailViewModel.getFilmDetail(imdbID: imdbID)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbID: "test")
    }
}
