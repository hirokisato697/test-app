//
//  SignInViewController.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/12.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSignInButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                guard let self = self else { return }
                if (result?.user) != nil {
                    self.performSegue(withIdentifier: "toMenu", sender: nil)
                }
                print(error as Any)
            }
    }

    @IBAction func didTapToSignUpButton() {
        self.performSegue(withIdentifier: "toSignUp", sender: nil)
    }

    
    @IBAction func didTapClashButton(_ sender: Any) {
        fatalError("Crashlytics test")
    }

}
