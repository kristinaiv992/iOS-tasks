//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Kristina Ivanova on 9/24/19.
//  Copyright © 2019 kristina Ivanova. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        
        musicPlayer.stop()
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }

    }

    func playGenre(genre: String)
    {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with : query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
