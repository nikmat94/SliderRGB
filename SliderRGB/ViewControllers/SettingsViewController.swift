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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        rgbView.layer.cornerRadius = 10
        
        redTF.text = roundSliderValue(for: red)
        greenTF.text = roundSliderValue(for: green)
        blueTF.text = roundSliderValue(for: blue)
        
        changeSliderFromTF()
        changeAlphaLabelFromTF()
    
        rgbView.backgroundColor = setBackgroundColor()
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        rgbView.backgroundColor = setBackgroundColor()
        
        redAlphaLabel.text = roundSliderValue(for: redSlider.value)
        greenAlphaLabel.text = roundSliderValue(for: greenSlider.value)
        blueAlphaLabel.text = roundSliderValue(for: blueSlider.value)
        
        redTF.text = roundSliderValue(for: redSlider.value)
        greenTF.text = roundSliderValue(for: greenSlider.value)
        blueTF.text = roundSliderValue(for: blueSlider.value)
    }
    
    @IBAction func fillTF(_ sender: UITextField) {
    }
    
    @IBAction func cancelSettings() {
        delegate.setNewColor(from: CGFloat(redSlider.value),
                             greenColor: CGFloat(greenSlider.value),
                             blueColor: CGFloat(blueSlider.value))
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
    
    private func changeSliderFromTF() {
    
        redSlider.value = Float(redTF.text!)!
        greenSlider.value = Float(greenTF.text!)!
        blueSlider.value = Float(blueTF.text!)!
    }
    
    private func changeAlphaLabelFromTF () {
        redAlphaLabel.text = redTF.text
        blueAlphaLabel.text = blueTF.text
        greenAlphaLabel.text = greenTF.text
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if (Float(textField.text!) ?? 1 < 0) || (Float(textField.text!) ?? 1 > 1) || Float(textField.text?.count ?? 1) > 4 {
            showAlert(with: "Wrong number!", and: "Write number in range from 0 to 1")
            return
        }
        
        changeSliderFromTF()
        changeAlphaLabelFromTF()
        rgbView.backgroundColor = setBackgroundColor()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

    

