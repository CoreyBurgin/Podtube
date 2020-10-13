//
//  RSSFeed.swift
//  Podtube
//
//  Created by Corey Burgin on 10/12/20.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]() // blank Episode array
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            
            episodes.append(episode)
        })
        return episodes
    }
    
}
