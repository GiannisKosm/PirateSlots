//
//  AudioPlayer.swift
//  Slots
//
//  Created by Ioannis Kosmopoulos on 25/1/21.
//

import Foundation

import SwiftUI
import AVFoundation

class AudioPlayer: ObservableObject {
    
    @Published var isPlaying = false
    
    var audioPlayer: AVAudioPlayer!
    
    func startPlayback(fileName: String, fileExtension: String){
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {return}
        
        let playbackSession = AVAudioSession.sharedInstance()
                    
            do{
                try
                playbackSession
                    .overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
                
            }
            catch{
            print("Error!")
            }
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            isPlaying = true
        }
        catch{
            print("Error")
        }
        }
    }

