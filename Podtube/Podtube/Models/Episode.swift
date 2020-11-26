//
//  Episode.swift
//  Podtube
//
//  Created by Corey Burgin on 10/10/20.
//

import Foundation
import FeedKit


struct Episode: Codable {
    let title: String
    let pubDate: Date
    let description: String
    let author: String
    let streamUrl: String
    
    var imageUrl: String?
    
    
    init(feedItem: RSSFeedItem) {
        
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        
        
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
