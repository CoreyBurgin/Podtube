//
//  PodcastsSearchController.swift
//  Podtube
//
//  Created by Corey Burgin on 9/28/20.
//

import UIKit
import Alamofire


class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [Podcast]()
    
    let cellId = "cellId"
    
    // lets implement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.9283757806, green: 0.9285091758, blue: 0.9283465743, alpha: 1)
        setupSearchBar()
        setupTableView()
        
        //searching for a podcast upon launch time.
        
        searchBar(searchController.searchBar, textDidChange: "Code Coffee Culture")
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(1)
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        hidesBottomBarWhenPushed = true
    }
    
    
    
    //MARK:- UITableView
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeController = EpisodesController()
        let podcast = self.podcasts[indexPath.row]
        episodeController.podcast = podcast
        navigationController?.pushViewController(episodeController, animated: true)
        hidesBottomBarWhenPushed = true
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Search for a Podcast"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.9604431987, green: 0.1978522241, blue: 0.3645554781, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //termary operator
        //if podcast search count is higher than 0 then header size will be 0 other wise its 250
        return  self.podcasts.count > 0 ? 0 : 250
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        
        let podcast = self.podcasts[indexPath.row]
        cell.podcast = podcast
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}














