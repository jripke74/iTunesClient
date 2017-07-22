//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/22/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation

class PendingOperations {
    
    var downloadInProgress = [IndexPath: Operation]()
    let downloadQueue = OperationQueue()
}
