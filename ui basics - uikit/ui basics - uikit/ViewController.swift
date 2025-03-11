//
//  ViewController.swift
//  ui basics - uikit
//
//  Created by Chaitanya Soni on 02/03/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label  = self.view.viewWithTag(999) as? UILabel
        label?.text = "Hello world!"
        
        button.setTitle("Press Me", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
    }


    @IBAction func buttonTap(_ sender: UIButton) {
        
        print("tapped!!")
    }
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        print(sender.selectedSegmentIndex)
        
    }
    
    @IBAction func sliderUpdated(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

