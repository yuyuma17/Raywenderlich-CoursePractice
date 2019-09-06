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
        round = 1
        
        startNewRound()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score = points
        
        let message = "Your score are \(points) points"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next Round", style: .default) { (UIAlertAction) in
            self.startNewRound()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        getTheScore()
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
        round = round + 1
    }
    
    func getTheScore() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

