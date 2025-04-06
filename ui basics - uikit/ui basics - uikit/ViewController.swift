//
//  ViewController.swift
//  ui basics - uikit
//
//  Created by Chaitanya Soni on 02/03/25.
//

import UIKit
//
//protocol ButtonAppearance {
//    var backgroundColor: UIColor { get set }
//    var title: String { get }
//}
//
//struct NextButtonAppearance: ButtonAppearance {
//    var backgroundColor: UIColor = .green
//    var title: String = "Next"
//}
//
//
//extension UIButton {
//    
//    convenience init(translateMasks: Bool) {
//        self.init(frame: .zero)
//        self.translatesAutoresizingMaskIntoConstraints = translateMasks
//    }
//    
//    func setAppearance(_ appearance: ButtonAppearance) {
//        self.backgroundColor = appearance.backgroundColor
//        self.setTitle(appearance.title, for: .normal)
//    }
//}



class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let button1 = UIButton()
    
    var button2: UIButton {
        return UIButton()
    }
    
    lazy var nextButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 8
        
        button.backgroundColor = UIColor(named: "green1")
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label  = self.view.viewWithTag(999) as? UILabel
        label?.text = "Hello world!"
        
        button.setTitle("Press Me", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
        
        self.view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
                                                constant: 20),
            
            nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,
                                                 constant: -20),
            
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor,
                                                                  constant: 20),
            
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
        nextButton.addTarget(self,
                             action: #selector(nextButtonTapped(_ :)),
                             for: .touchUpInside)
//
//        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
//                                            constant: 20).isActive = true
//        
//        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,
//                                             constant: 20).isActive = true
//        
//        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor,
//                                                              constant: 20).isActive = true
        
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        
        let someVC = UIViewController()
        someVC.loadViewIfNeeded()
        someVC.view.backgroundColor = .gray
        someVC.modalPresentationStyle = .overCurrentContext
//        self.present(someVC, animated: true)
        
        self.addChild(someVC)
        
        self.view.addSubview(someVC.view)
        self.view.leadingAnchor.constraint(equalTo: someVC.view.leadingAnchor).isActive = true
        self.view.trailingAnchor.constraint(equalTo: someVC.view.trailingAnchor).isActive = true
        self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: someVC.view.topAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: someVC.view.bottomAnchor).isActive = true
        
        self.show(someVC, sender: self)
//        self.navigationController?.pushViewController(someVC, animated: true)
        
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

