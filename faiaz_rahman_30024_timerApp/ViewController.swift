//
//  ViewController.swift
//  faiaz_rahman_30024_timerApp
//
//  Created by bjit on 29/12/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var player1Image: UIImageView!
    
    @IBOutlet weak var finishLine: UIImageView!
    
    @IBOutlet weak var popperImage: UIImageView!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBOutlet weak var timeV1: UILabel!
    @IBOutlet weak var timeV2: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    var myTimer = Timer()
    var timeToDisplay = 0
    var xPoint = 60

    var spentTimeA = 0
    var countTimeA = 0
    //var acceleration = 0.0
    
    var musicPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Image.frame = CGRect(x: -1, y: -1, width: 150, height: 300)
        player1Image.center = CGPoint(x: 60, y: 400)
        finishLine.frame = CGRect(x: -1, y: -1, width: 100, height: 100)
        finishLine.center = CGPoint(x: 360, y: 420)
        player1Image.image = UIImage(named: "womanStart")
      //  player1Image.loadGif(name: "womanRun")
        finishLine.image = UIImage(named: "finishLine")
        timeV1.text = "Total Time: "
        timeV2.text = "\(spentTimeA) sec"
        
    }

    @IBAction func startBtn(_ sender: Any) {
        myTimer.invalidate()
        player1Image.loadGif(name: "womanRun")
        let interval = 0.05
         
        myTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(ActionC), userInfo: nil, repeats: true)
        
        playSound()
        
     
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "crowd2", withExtension: "wav")
            musicPlayer = try! AVAudioPlayer(contentsOf: url!)
            musicPlayer.play()
        }
    
    @IBAction func pauseBtn(_ sender: Any) {
        myTimer.invalidate()
        player1Image.image = UIImage(named: "womanStopFinal")
    }
    @IBAction func Resume(_ sender: Any) {
        myTimer.invalidate()
        timeToDisplay = 0
        timeLabel.text = "Total Distance: 0 m"
        player1Image.center = CGPoint(x: 60, y: 400)
        player1Image.image = UIImage(named: "womanStart")
        //player1Image.loadGif(name: "womanRun")
        popperImage.loadGif(name: "asd")
        xPoint = 60
        startOutlet.alpha = 1
        spentTimeA = 0
        timeV1.text = "Total Time: "
        timeV2.text = "\(spentTimeA) sec"
        speedLabel.text = "Speed: counting..."
      //  acceleration = 0.0
        musicPlayer.stop()
    }
    
    @objc func ActionC(){
    
        timeToDisplay += 1
        self.view.backgroundColor = .random
        timeLabel.text = "Total Distance: \(String(timeToDisplay)) m"
        

        let xPosition = xPoint
        player1Image.center = CGPoint(x: xPosition, y: 400)
        
        countTimeA = countTimeA + 1
        xPoint += 1
        if countTimeA == 20{
        spentTimeA = spentTimeA + 1
        timeV2.text = "\(spentTimeA) sec"
            countTimeA = 0
        }
        
        
        
        
        if xPoint == 360{
            pauseBtn(self)
            player1Image.image = UIImage(named: "womanStart")
            popperImage.loadGif(name: "popper")
            startOutlet.alpha = 0
            speedLabel.text = "Speed: \(xPoint/spentTimeA) m/s"
            //playSound()
            musicPlayer.stop()
            
        }
    }
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.3...1),
                       green: .random(in: 0.3...1),
                       blue: .random(in: 0.3...1),
                       alpha: 1)
    }
}

