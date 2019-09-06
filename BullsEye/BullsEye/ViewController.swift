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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        startNewRound()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = difference * -1
        }
        
        let message = "The value of the slider is now: \(currentValue)" + "\n The target value is: \(targetValue)" + "\n The difference is \(difference)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
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
    }

}

