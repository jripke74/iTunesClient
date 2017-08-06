//
//  Artist.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

class Artist {
    let id: Int
    let name: String
    let primaryGenre: Genre
    var albums: [Album]
    let artistWebsite: String
    
    init(id: Int, name: String, primaryGenre: Genre, albums: [Album], artistWebsite: String) {
        self.id = id
        self.name = name
        self.primaryGenre = primaryGenre
        self.albums = albums
        self.artistWebsite = artistWebsite
    }
}

extension Artist {
    convenience init?(json: [String: Any]) {
        struct Key {
            static let artistName = "artistName"
            static let artistId = "artistId"
            static let primaryGenreId = "primaryGenreId"
            static let artistLinkUrl = "artistLinkUrl"
        }
        guard let artistName = json[Key.artistName] as? String,
               let artistId = json[Key.artistId] as? Int,
               let primaryGenreId = json[Key.primaryGenreId] as? Int,
               let primaryGenreValue = Genre(rawValue: primaryGenreId),
               let artistLinkUrl = json[Key.artistLinkUrl] as? String
               else {
                  return nil
               }
        self.init(id: artistId, name: artistName, primaryGenre: primaryGenreValue, albums: [], artistWebsite: artistLinkUrl)
    }
}
