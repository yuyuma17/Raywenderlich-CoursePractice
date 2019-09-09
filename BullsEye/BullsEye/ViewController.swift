//
//  ViewController.swift
//  BullsEye
//
//  Created by 黃士軒 on 2019/9/6.
//  Copyright © 2019 黃士軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        scoreLabel.text = "0"
        roundLabel.text = "1"
        round = 1
        
        startNewRound()
        
//      Another way is set = Image Literal
//      let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        score = score + points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points = points + 100
        }
        else if difference < 5 {
            title = "You almost had it!"
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
            
        let message = "Your score are \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next Round", style: .default) { (UIAlertAction) in
            self.startNewRound()
            self.round = self.round + 1
            self.roundLabel.text = String(self.round)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        targetLabel.text = String(targetValue)
        
        getTheScore()
    }
    
    func getTheScore() {
        scoreLabel.text = String(score)
    }
    
    @IBAction func startOverButton(_ sender: UIButton) {
        score = 0
        scoreLabel.text = String(score)
        round = 1
        roundLabel.text = String(round)
    }
}

