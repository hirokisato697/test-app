//
//  ProfileUpdateViewController.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/12.
//

import UIKit
import FirebaseAuth

class MailAddressUpdateViewController: UIViewController {

    let user = Auth.auth().currentUser

    @IBOutlet weak var currentMailAddress: UILabel!
    @IBOutlet weak var newMailAddress: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        currentMailAddress.text = user?.email
    }
    
    @IBAction func didTapProfileUpdateButton() {
        let newMailAddress = newMailAddress.text ?? ""

        Auth.auth().currentUser?.updateEmail(to: newMailAddress) { error in
            print(error as Any)
        }

        let menu = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.navigationController?.pushViewController(menu!, animated: true)
    }
    
}
