//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Jeff Ripke on 7/20/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(SearchResultsController.dismissSearchResultsController))
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        tableView.dataSource = dataSource
        definesPresentationContext = true
    }
    
    func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                artist.albums = Stub.albums
                let albumListController = segue.destination as! AlbumListController
                albumListController.artist = artist
            }
        }
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        client.searchForArtist(withTerm: searchController.searchBar.text!) { [weak self] artists, error in
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
}
