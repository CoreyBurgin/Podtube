//
//  PlayersDetailsview.swift
//  Podtube
//
//  Created by Corey Burgin on 10/12/20.
//

import UIKit
import AVKit

class PlayersDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            authorLabel.text = episode.author
            
            playEpisode()
        
            guard let url = URL(string: episode.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
            
            
        }
    }
    
    
    fileprivate func playEpisode() {
        print("Trying to play episode", episode.streamUrl)
        
        guard let url = URL(string: episode.streamUrl) else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    //MARK:- IB Actions and Outlets
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!


    @IBOutlet weak var episodeTitleLabel: UILabel! {
        didSet{
            episodeTitleLabel.numberOfLines = 2
        }
    }
    


    @IBOutlet weak var authorLabel: UILabel!
    


 
    
    @IBOutlet weak var playPauseButton: UIButton! {
        didSet {
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            playPauseButton.addTarget(self, action: #selector(handlePlayPause), for: .touchUpInside)
        }
    }
    
    @objc func handlePlayPause() {
        print("Trying to play and pause")
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "Play Button"), for: .normal)
        }
    
        
    }
    
    

}
