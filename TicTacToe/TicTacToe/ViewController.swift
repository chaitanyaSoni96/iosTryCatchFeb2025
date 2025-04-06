//
//  ViewController.swift
//  TicTacToe
//
//  Created by Chaitanya Soni on 11/03/25.
//

import UIKit

class TicTacButton: UIButton {
    enum TicTacButtonState: String, Equatable {
        case empty = "empty"
        case x = "x"
        case o = "o"
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            if lhs.rawValue == "x" && rhs.rawValue == "x" {
                return true
            } else if lhs.rawValue == "o" && rhs.rawValue == "o" {
                return true
            } else if lhs.rawValue == "x" && rhs.rawValue == "o" {
                return false
            } else if lhs.rawValue == "o" && rhs.rawValue == "x" {
                return false
            } else if lhs.rawValue == "empty" && rhs.rawValue == "empty" {
                return false
            } else if lhs.rawValue == "x" && rhs.rawValue == "empty" {
                return false
            } else if lhs.rawValue == "o" && rhs.rawValue == "empty" {
                return false
            } else if lhs.rawValue == "empty" && rhs.rawValue == "x" {
                return false
            } else if lhs.rawValue == "empty" && rhs.rawValue == "o" {
                return false
            }
            fatalError()
        }
    }
    
    var selectionState: TicTacButtonState = .empty {
        didSet {
            
            if self.selectionState.rawValue == "empty" {
                
                self.setImage(nil, for: .normal)
                
            } else if self.selectionState.rawValue == "x" {
                
                self.setImage(UIImage(named: "x"), for: .normal)
                
            } else if self.selectionState.rawValue == "o" {
                
                self.setImage(UIImage(named: "o"), for: .normal)
                
            }
        }
    }
    
}

class ViewController: UIViewController {

    enum Player {
        case draw
        case x
        case o
    }
    private var currentPlayer: ViewController.Player = .x
    private var winningPlayer: ViewController.Player? {
        didSet {
            if winningPlayer == nil {
                self.winnerLabel.text = nil
                self.buttons.forEach({ $0.selectionState = .empty })
                self.currentPlayer = .x
            } else {
                self.winnerLabel.text = {
                    if winningPlayer == .draw {
                        return "Draw!"
                    } else if winningPlayer == .x {
                        return "X Wins!"
                    } else {
                        return "O Wins!"
                    }
                }()
            }
        }
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var buttons: [TicTacButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = Button.init()
        
        
    }

    @IBAction func buttonTap(_ sender: TicTacButton) {
        
        guard self.winningPlayer == nil else {
            self.winningPlayer = nil
            return
        }
        
        guard sender.selectionState.rawValue == "empty" else {
            return
        }
        
        if currentPlayer == .x {
            sender.selectionState = .x
            currentPlayer = .o
        } else {
            sender.selectionState = .o
            currentPlayer = .x
        }
        
        checkForWin()
    }
    
    func checkForWin() {
        
        
        
        
        
        let selectionStates: [TicTacButton.TicTacButtonState] = self.buttons.map({ $0.selectionState })
        print(buttons)
        
        /*
         0,1,2
         3,4,5
         6,7,8
         */
        if selectionStates[0] == selectionStates[1] &&
            selectionStates[1] == selectionStates[2] {
            self.winningPlayer = selectionStates[0] == .x ? .x : .o
            return
        }
        if selectionStates[3] == selectionStates[4] &&
            selectionStates[4] == selectionStates[5] {
            self.winningPlayer = selectionStates[3] == .x ? .x : .o
            return
        }
        if selectionStates[6] == selectionStates[7] &&
            selectionStates[7] == selectionStates[8] {
            self.winningPlayer = selectionStates[0] == .x ? .x : .o
            return
        }
        
        /*
         0,3,6
         1,4,7
         2,5,8
         */
        if selectionStates[0] == selectionStates[3] &&
            selectionStates[3] == selectionStates[6] {
            self.winningPlayer = selectionStates[0] == .x ? .x : .o
            return
        }
        if selectionStates[1] == selectionStates[4] &&
            selectionStates[4] == selectionStates[7] {
            self.winningPlayer = selectionStates[1] == .x ? .x : .o
            return
        }
        if selectionStates[2] == selectionStates[5] &&
            selectionStates[5] == selectionStates[8] {
            self.winningPlayer = selectionStates[2] == .x ? .x : .o
            return
        }
        
        
        /*
         0,4,8
         2,4,6
        */
        if selectionStates[0] == selectionStates[4] &&
            selectionStates[4] == selectionStates[8] {
            self.winningPlayer = selectionStates[0] == .x ? .x : .o
            return
        }
        if selectionStates[2] == selectionStates[4] &&
            selectionStates[4] == selectionStates[6] {
            self.winningPlayer = selectionStates[2] == .x ? .x : .o
            return
        }
        
        //draw
        if !selectionStates.contains(where: { $0.rawValue == "empty" }) {
            self.winningPlayer = .draw
        }
    }
}

