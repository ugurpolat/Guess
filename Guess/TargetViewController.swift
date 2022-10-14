//
//  TargetViewController.swift
//  Guess
//
//  Created by Ugur Polat on 10/14/22.
//

import UIKit

class TargetViewController: UIViewController {
    var msg:String?
    @IBOutlet weak var etiket: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        etiket.text = msg!
    }

}
