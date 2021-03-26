//
//  ViewController.swift
//  SliderRGB
//
//  Created by Никита  on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redAlphaLabel: UILabel!
    @IBOutlet var greenAlphaLabel: UILabel!
    @IBOutlet var blueAlphaLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private var red: CGFloat = 0.0
    private var green: CGFloat = 0.0
    private var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 10
        red = CGFloat(redSlider.value)
        green = CGFloat(greenSlider.value)
        blue = CGFloat(blueSlider.value)
        
        redAlphaLabel.text = String(redSlider.value)
        greenAlphaLabel.text = String(greenSlider.value)
        blueAlphaLabel.text = String(blueSlider.value)
        
        rgbView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
}

    

