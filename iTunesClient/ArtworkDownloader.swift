//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/22/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import UIKit

class ArtworkDownloader: Operation {
    
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    override func main() {
        if isCancelled {
            return
        }
        guard let url = URL(string: album.artworkURL) else {
            return
        }
        // need to handle errors
        let imageData = try! Data(contentsOf: url)
        if isCancelled {
            return
        }
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            album.artworkState = .failed
        }
    }
}
