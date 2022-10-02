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
    
    enum authStatus: String  {
        case open
        case closed
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView(frame: CGRect(x: 200, y: 100, width: 320, height: 50))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
    }

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
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
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

