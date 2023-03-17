//
//  ViewController.swift
//  TrafficLights
//
//  Created by Alex on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerRadiusSet(for: redLightView)
        cornerRadiusSet(for: yellowLightView)
        cornerRadiusSet(for: greenLightView)
        
        startButton.layer.cornerRadius = 10
    }
    
    @IBAction func pushingButton(_ sender: UIButton) {
        startButton.setTitle("NEXT", for: .normal)
        
        if redLightView.alpha < 1 && yellowLightView.alpha < 1 && greenLightView.alpha < 1 {
            redLightView.alpha = 1
        } else if redLightView.alpha == 1 {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
        } else if yellowLightView.alpha == 1 {
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        } else if greenLightView.alpha == 1 {
            greenLightView.alpha = 0.3
            redLightView.alpha = 1
        }
    }
    
    private func cornerRadiusSet(for view: UIView) {
        view.layer.cornerRadius = 75
    }
    
}

