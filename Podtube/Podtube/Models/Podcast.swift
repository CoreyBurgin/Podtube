//
//  Podcast.swift
//  Podtube
//
//  Created by Corey Burgin on 9/28/20.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var primaryGenreName: String?
    var feedUrl: String?
    
}
