//
//  ViewController.swift
//  TrafficLights
//
//  Created by Alex on 17.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Private Properties
    private var currentLight: CurrentLight = .red
    private let lightIsOn: CGFloat = 1.0
    private let lightIsOff: CGFloat = 0.3
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    // MARK: - IBActions
    @IBAction func pushingButton() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            UIView.animate(withDuration: 0.5) {
                self.greenLightView.alpha = self.lightIsOff
                self.redLightView.alpha = self.lightIsOn
            }
            currentLight = .yellow
        case.yellow:
            UIView.animate(withDuration: 0.5) {
                self.redLightView.alpha = self.lightIsOff
                self.yellowLightView.alpha = self.lightIsOn
            }
            currentLight = .green
        case .green:
            UIView.animate(withDuration: 0.5) {
                self.yellowLightView.alpha = self.lightIsOff
                self.greenLightView.alpha = self.lightIsOn
            }
            currentLight = .red
        }
    }
}

extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
