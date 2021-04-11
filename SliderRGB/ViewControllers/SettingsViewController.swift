//
//  ViewController.swift
//  SliderRGB
//
//  Created by Никита  on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redAlphaLabel: UILabel!
    @IBOutlet var greenAlphaLabel: UILabel!
    @IBOutlet var blueAlphaLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    
    var red: Float = 0.0
    var green: Float = 0.0
    var blue: Float = 0.0
    
    var delegate: SettingsViewControllerDelegate!
    
    
    var color: UIColor!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 10
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
    
        redAlphaLabel.text = String(redSlider.value)
        greenAlphaLabel.text = String(greenSlider.value)
        blueAlphaLabel.text = String(blueSlider.value)
        
        rgbView.backgroundColor = setBackgroundColor()
        
    }
    
    @IBAction func redSliderAction() {
        redAlphaLabel.text = roundSliderValue(for: redSlider.value)
        rgbView.backgroundColor = setBackgroundColor()
    }
    
    @IBAction func greenSliderAction() {
        greenAlphaLabel.text = roundSliderValue(for: greenSlider.value)
        rgbView.backgroundColor = setBackgroundColor()
    }
    @IBAction func blueSliderAction() {
        blueAlphaLabel.text = roundSliderValue(for: blueSlider.value)
        rgbView.backgroundColor = setBackgroundColor()
    }
    
    @IBAction func cancelSettings() {
        delegate.setNewColor(from: CGFloat(redSlider.value), greenColor: CGFloat(greenSlider.value), blueColor: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }
    private func setBackgroundColor () -> UIColor {
        return UIColor(displayP3Red: CGFloat(redSlider.value),
                       green: CGFloat(greenSlider.value),
                       blue: CGFloat(blueSlider.value),
                       alpha: 1)
    }
    
    private func roundSliderValue (for value: Float) -> String {
        return String(round(100 * Double(value)) / 100)
    }

}

    

