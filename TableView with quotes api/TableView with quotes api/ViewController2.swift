//
//  ViewController2.swift
//  TableView with quotes api
//
//  Created by Chaitanya Soni on 06/04/25.
//

import UIKit

class ViewController2: UIViewController {
    static func instantiate(text: String) -> ViewController2 {
        let vc = ViewController2()
        vc.text = text
        return vc
    }
    
    
    lazy var textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        textView.text = self.text
    }
}
