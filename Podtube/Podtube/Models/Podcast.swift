//
//  Podcast.swift
//  Podtube
//
//  Created by Corey Burgin on 9/28/20.
//

import Foundation

class Podcast: NSObject, Decodable, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        print("Trying to transform Podcast into Data")
        aCoder.encode(trackName ?? "", forKey: "trackNameKey")
        aCoder.encode(artistName ?? "", forKey: "artistNameKey")
        aCoder.encode(artworkUrl600 ?? "", forKey: "artworkKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Trying to turn Data into Podcast")
        self.trackName = aDecoder.decodeObject(forKey: "trackNameKey") as? String
        self.artistName = aDecoder.decodeObject(forKey: "artistNameKey") as? String
        self.artworkUrl600 = aDecoder.decodeObject(forKey: "artworkKey") as? String
    }
    
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var primaryGenreName: String?
    var feedUrl: String?
    
}
