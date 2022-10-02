//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Kazakov Danil on 29.09.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var greeting: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = ("hello, your login is - \(greeting ?? "Please register")")
    }
}
