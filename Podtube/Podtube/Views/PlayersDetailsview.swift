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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let time = CMTimeMake(value: 1, timescale: 3)
        let times = [NSValue(time: time)]
        player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
            print("Episode started playing")
            self.enlargeEpisodeImageView()
        }
    }
    
    //MARK:- IB Actions and Outlets
    
    @IBAction func handleDismiss(_ sender: Any) {
       self.removeFromSuperview()
    }
    
    fileprivate func enlargeEpisodeImageView() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = .identity
        })
    }
    
    fileprivate let shrunkenTransform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    
    fileprivate func shrinkEpisodeImageView() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = self.shrunkenTransform
        })
    }
    
    @IBOutlet weak var episodeImageView: UIImageView! {
        didSet {
            episodeImageView.layer.cornerRadius = 5
            episodeImageView.clipsToBounds = true
            let scale: CGFloat = 0.7
            episodeImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
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
            enlargeEpisodeImageView()
        } else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "Play Button").withRenderingMode(.alwaysOriginal), for: .normal)
            shrinkEpisodeImageView()
        }
    
        
    }
    
    

}
