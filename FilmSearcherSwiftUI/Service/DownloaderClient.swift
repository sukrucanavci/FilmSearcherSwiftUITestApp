//
//  DownloaderClient.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import Foundation

class DownloaderClient {
    
    func downloadFilms(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=bf512d08") else {
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
}

enum DownloaderError: Error {
    case wrongURL
    case noData
    case dataProcessFail
}
