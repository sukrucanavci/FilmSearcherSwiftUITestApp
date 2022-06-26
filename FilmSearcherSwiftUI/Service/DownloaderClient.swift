//
//  DownloaderClient.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import Foundation

class DownloaderClient {
    
    let BASE_URL = "https://www.omdbapi.com"
    let API_KEY = "bf512d08"
    
    func downloadFilms(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "\(BASE_URL)/?s=\(search)&apikey=\(API_KEY)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let result = try? JSONDecoder().decode(DownloadedFilms.self, from: data) else {
                return completion(.failure(.dataProcessFail))
            }
            
            completion(.success(result.films))
        }.resume() 
    }
    
    func downloadFilmDetail(imdbID: String, completion: @escaping (Result<FilmDetail?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "\(BASE_URL)/?i=\(imdbID)&apikey=\(API_KEY)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let result = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.dataProcessFail))
            }
            
            completion(.success(result))
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongURL
    case noData
    case dataProcessFail
}
