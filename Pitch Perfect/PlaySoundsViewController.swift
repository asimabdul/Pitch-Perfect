//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Asim Abdul on 7/16/15.
//  Copyright (c) 2015 AsimAbdul. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.fileURL, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.fileURL, error: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func launchAudioPlayer(rate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let audioPitch = AVAudioUnitTimePitch()
        audioPitch.pitch = pitch
        audioEngine.attachNode(audioPitch)
        
        audioEngine.connect(audioPlayerNode, to: audioPitch, format: nil)
        audioEngine.connect(audioPitch, to: audioEngine.outputNode, format: nil)
        
        //This is for playing the file - Schedule file, start audio engine and play the file
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    @IBAction func playSlowSound(sender: UIButton) {
        launchAudioPlayer(0.5)
    }

    @IBAction func playFastSound(sender: UIButton) {
        launchAudioPlayer(2.0)
    }
    
    @IBAction func stopAllAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    
    @IBAction func playChipmunkSound(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    /*
    0
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}