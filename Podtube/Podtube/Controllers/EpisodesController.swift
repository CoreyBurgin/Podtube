//
//  EpisodesController.swift
//  Podtube
//
//  Created by Corey Burgin on 10/8/20.
//

import UIKit

class EpisodesController: UITableViewController {
    
    
    var podcast: Podcast? {
        didSet{
            navigationItem.title = podcast?.trackName
        }
    }
    
    
    fileprivate let cellId = "cellId"
    
    struct Episode {
        let title: String
    }
    
    var episodes = [
        Episode(title: "First Eppi"),
        Episode(title: "Second Eppi"),
        Episode(title: "Third Eppi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
   //MARK:- UITableView
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
}
