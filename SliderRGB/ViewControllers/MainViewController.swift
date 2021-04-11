//
//  MainViewController.swift
//  SliderRGB
//
//  Created by Никита  on 09.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(from redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
}

class MainViewController: UIViewController {

    private var red: CGFloat = 1
    private var green: CGFloat = 1
    private var blue: CGFloat = 0
    
    private var color: UIColor {
        UIColor(displayP3Red: 1, green: green, blue: blue, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.red = Float(red)
        settingsVC.green = Float(green)
        settingsVC.blue = Float(blue)
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(from redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        red = redColor
        green = greenColor
        blue = blueColor
        view.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
}
