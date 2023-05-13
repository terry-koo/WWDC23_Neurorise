//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/14.
//

import AVFoundation

class Player {
    static var audioPlayers: [AVAudioPlayer] = []
    
    static func playMusic(_ title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "mp3") else {
            print("mp3 file not found")
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = 0
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayers.append(audioPlayer)
        } catch {
            print("audio error")
        }
    }
    
    static func stopAllMusic() {
        for audioPlayer in audioPlayers {
            audioPlayer.stop()
        }
        audioPlayers.removeAll()
    }
    
    static func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "FloralNights", withExtension: "mp3") else {
            print("FloralNights.mp3 file not found")
            return
        }

        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayers.append(audioPlayer)
        } catch {
            print("audio error")
        }
    }
}
