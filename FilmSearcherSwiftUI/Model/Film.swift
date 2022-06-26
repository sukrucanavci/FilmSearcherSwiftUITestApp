//
//  Film.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Search
struct Film: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

struct DownloadedFilms: Codable {
    let films: [Film]
    
    private enum CodingKeys: String, CodingKey {
        case films = "Search"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
