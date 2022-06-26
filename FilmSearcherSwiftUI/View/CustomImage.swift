//
//  CustomImage.swift
//  FilmSearcherSwiftUI
//
//  Created by Şükrü Can Avcı on 26.06.2022.
//

import SwiftUI

struct CustomImage: View {
    
    let url: String
    
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(url: "https://m.media-amazon.com/images/M/MV5BNTYyM2FkZmYtZGEwMS00NDMwLWFhYTMtMDU4NzVhYzVmMDYyXkEyXkFqcGdeQXVyNjMwMjk0MTQ@._V1_SX300.jpg")
    }
}
