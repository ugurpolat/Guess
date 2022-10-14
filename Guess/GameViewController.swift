//
//  GameViewController.swift
//  Guess
//
//  Created by Ugur Polat on 10/13/22.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    let myGuess = "20";
    var lives = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func guessClicked(_ sender: Any) {
        checkMyGuess(guessNumber: guessTextField.text!)
    }
    
    @IBAction func cleanPlaceHolder(_ sender: UITextField) {
        sender.placeholder = ""
    }
    
    func checkMyGuess(guessNumber:String) {
        if guessNumber != "" {
            if guessNumber != myGuess {
                lives -= 1
                guessTextField.text = "";
                guessLabel.text = "\(lives) lives left"
                guessTextField.placeholder = ""
                if lives == 0 {
                    
                    changePage(result: ":(")
                }
            } else {
                changePage(result:":)")
            }
            
        } else {
            warnPlaceHolder()
        }
    }
    
    
    func changePage(result:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "target") as! TargetViewController
        
        let sendMessage:String = result
        targetViewController.msg = sendMessage
        self.navigationController?.pushViewController(targetViewController, animated: true)
    }
    
    func warnPlaceHolder(){
        let placeholder = "Your guess"
        guessTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
        )
    }
}

