//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/21/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
