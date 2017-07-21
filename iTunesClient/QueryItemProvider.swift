//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/21/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
