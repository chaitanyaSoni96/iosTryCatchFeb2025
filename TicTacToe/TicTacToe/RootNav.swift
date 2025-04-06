//
//  RootNav.swift
//  TicTacToe
//
//  Created by Chaitanya Soni on 05/04/25.
//

import UIKit
import Combine

enum AppState {
    case splash
    case splashComplete
    case unverifiedUser
    case loginComplete
}

let pub = CurrentValueSubject<AppState, Never>(.splash)

class RootNav: UINavigationController {
    var splashComplete: (() ->())?
    
    
    var cancellables: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pub.sink { appState in
            switch appState {
            case .splash:
                self.setViewControllers([UIViewController()], animated: false)
            case .splashComplete:
                //access db/keychaing
                //send event to ppublisher
                pub.send(.unverifiedUser)
            case .unverifiedUser:
                self.setViewControllers([UIViewController()], animated: false)
            case .loginComplete:
                self.setViewControllers([UIViewController()], animated: false)
            }
        }.store(in: &cancellables)
        
        
    }
}
