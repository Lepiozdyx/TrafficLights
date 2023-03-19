//
//  ViewController.swift
//  TrafficLights
//
//  Created by Alex on 17.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private let alphaOn: CGFloat = 1
    private let alphaOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerRadiusSet(for: redLightView)
        cornerRadiusSet(for: yellowLightView)
        cornerRadiusSet(for: greenLightView)
        
        startButton.layer.cornerRadius = 10
    }
    
    @IBAction func pushingButton(_ sender: UIButton) {
        
        if redLightView.alpha < alphaOn,
            yellowLightView.alpha < alphaOn, 
            greenLightView.alpha < alphaOn {
            startButton.setTitle("NEXT", for: .normal)
            redLightView.alpha = alphaOn
        } else if redLightView.alpha == alphaOn {
            redLightView.alpha = alphaOff
            yellowLightView.alpha = alphaOn
        } else if yellowLightView.alpha == alphaOn {
            yellowLightView.alpha = alphaOff
            greenLightView.alpha = alphaOn
        } else if greenLightView.alpha == alphaOn {
            greenLightView.alpha = alphaOff
            redLightView.alpha = alphaOn
        }
    }
    
    private func cornerRadiusSet(for view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
    }
    
}

