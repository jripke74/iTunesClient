//
//  ViewController.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let endpoint = Itunes.search(term: "talor swift", media: .music)
        print(endpoint.request)
    }
}
