//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 5*60,
        "Medium": 7*60,
        "Hard": 12*60
    ]
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var totalCookTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
            
        timer.invalidate()
        let hardness = sender.currentTitle
        totalCookTime = eggTimes[hardness!]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        eggLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalCookTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalCookTime)
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            eggLabel.text = "DONE!"
            playAlarm()
        }
    }
}
