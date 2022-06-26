//
//  ImageDownloaderClient.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import Foundation

class ImageDownloaderClient: ObservableObject {
    
    @Published var downloadedImage: Data?
    
    func downloadImage(url: String){
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.downloadedImage = data
            }
            
        }.resume()
    }
}
