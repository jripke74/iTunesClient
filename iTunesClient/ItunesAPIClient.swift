//
//  ItunesAPIClient.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/21/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtist(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }
                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                let artists = results.flatMap { Artist(json: $0) }
                completion(artists, nil)
            }
        }
        
        task.resume()
    }
}
