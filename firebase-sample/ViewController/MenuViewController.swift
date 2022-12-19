//
//  MenuViewController.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/12.
//

import UIKit
import FirebaseAuth

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func didTapMailAddressUpdateButton() {
        self.performSegue(withIdentifier: "toMailAddressUpdate", sender: nil)
    }

    @IBAction func didTapPasswordUpdateButton() {
        self.performSegue(withIdentifier: "toPasswordUpdate", sender: nil)
    }

    @IBAction func didTapWebViewButton() {
        self.performSegue(withIdentifier: "toWebView", sender: nil)
    }

    @IBAction func didTapSecondWebViewButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecondWebView", sender: nil)
    }

    @IBAction func didTapProfileDeletebutton() {
        Auth.auth().currentUser?.delete() { [weak self] error in
            guard let self = self else { return }
            if error != nil {
                print(error as Any)
            } else {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }


    @IBAction func didTapSignOutButton() {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let error {
            print(error as Any)
        }
    }

}
