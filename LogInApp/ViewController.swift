//
//  ViewController.swift
//  LogInApp
//
//  Created by Kazakov Danil on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginOutlet: UITextField!
    @IBOutlet var passwordOutlet: UITextField!
    
    var login = "Max"
    var password = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeView = segue.destination as? WelcomeViewController else { return }
        welcomeView.greeting = loginOutlet.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func unwind(for Segue: UIStoryboardSegue) {
        guard Segue.source is WelcomeViewController else { return }
        loginOutlet.text = ""
        passwordOutlet.text = ""
    }
    
    @IBAction func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func LogInActionButton() {
        if loginOutlet.text == login && passwordOutlet.text == password {
            performSegue(withIdentifier: "goToSecondScreen", sender: nil)
        } else {
            let alert = UIAlertController(title: "error enter", message: "Your login or password is incorrect", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Again", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotLoginAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Your login is", message: login, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Thx!", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Your password is", message: password, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Thx!", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

