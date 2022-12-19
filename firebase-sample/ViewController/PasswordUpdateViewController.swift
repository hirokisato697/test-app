//
//  PasswordUpdateViewController.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/14.
//

import UIKit
import FirebaseAuth

class PasswordUpdateViewController: UIViewController {

    @IBOutlet weak var newPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapPasswordUpdate() {
        let newPassword = newPassword.text ?? ""

        Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
            print(error as Any)
        }

        let menu = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.navigationController?.pushViewController(menu!, animated: true)
    }

}
