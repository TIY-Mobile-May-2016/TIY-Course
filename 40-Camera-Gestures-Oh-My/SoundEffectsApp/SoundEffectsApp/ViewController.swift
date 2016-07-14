//
//  ViewController.swift
//  SoundEffectsApp
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var backgroundPlayer:AVAudioPlayer?
    
    var soundeffectsPlayer:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundPlayer = self.getAudioPlayer("happy", fileExt: "mp3")
        
        //self.backgroundPlayer?.play()
        
        self.soundeffectsPlayer = self.getAudioPlayer("tick", fileExt: "caf")
        
        self.soundeffectsPlayer?.numberOfLoops = -1
        
        //self.soundeffectsPlayer?.play()
        
        
        
    }
    
    func getAudioPlayer(filename: String, fileExt: String) -> AVAudioPlayer? {
        
        var audioPlayer : AVAudioPlayer?
        
        // Get a pointer to the reference of the file
        if let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileExt) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePath)
                
                audioPlayer?.volume = 1.0
                audioPlayer?.prepareToPlay()
                
            } catch {
                
                print("An error occured")
                
            }
            
        } else {
            print("I cant find the file")
        }

        return audioPlayer
    }
    

    @IBAction func playTapped(sender: UIButton) {
        
        print("playTapped")
        
        self.backgroundPlayer?.play()
    }
    
    
    @IBAction func stopTapped(sender: UIButton) {
        
        print("stopTapped")
        
        self.backgroundPlayer?.stop()
    }
    

}

