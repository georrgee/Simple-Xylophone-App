//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer : AVAudioPlayer? // creating a AVAudioPlayer variable
    var selectedSoundFileName : String = "" // leaving the string empty
    let soundsArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"] // an array containing all the sound files
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        selectedSoundFileName = soundsArray[sender.tag] // selectedSoundFileName would equal to (i.e) note1 since the soundsArray[0] (the tag)
        print(selectedSoundFileName)
        playSound()
    }
    
    func playSound(){
        
        let url = Bundle.main.path(forResource: selectedSoundFileName, ofType: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error as NSError{
            print("AudioPlayer error \(error.localizedDescription)")
        }
        
    }

}

