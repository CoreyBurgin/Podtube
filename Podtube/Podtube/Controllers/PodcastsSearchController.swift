//
//  PodcastsSearchController.swift
//  Podtube
//
//  Created by Corey Burgin on 9/28/20.
//

import UIKit


class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
         Podcast(name: "JBP", artistName: "Joe budden"),
        Podcast(name: "Billant idiots", artistName: "CTHG")
    ]
    
    
    
    let cellId = "cellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupSearchBar()
        setupTableView()
        
        
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        // later implement Alamofire to search iTunes API
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    //MARK:- UITableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "play_circle_filled")
        
        return cell
    }
    
    
}
