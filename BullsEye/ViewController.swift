//
//  ViewController.swift
//  BullsEye
//
//  Created by user on 19.09.2019.
//  Copyright © 2019 Artem Ulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        self.startNewRound()
//        or startNewRound() without self
    }
    
    @IBAction func showHitMeAlert(){
        
        var difference = currentValue - targetValue
        
        if difference < 0 {
            difference = difference * -1
        }
        
        let message = "The value of the slider is now: \(currentValue)" +
        "\n The target value is: \(targetValue)" +
        "\n The difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        self.startNewRound()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

