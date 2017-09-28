//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/20/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

// use an extension to not mess with defualt memberwize initializers
extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        // Track time in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.runtime = "\(minutes): \(seconds)"
    }
}
