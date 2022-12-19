//
//  UIAlertController+Extention.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/16.
//

import UIKit

extension UIAlertController {

    // Basic認証用アラート
    static func basicAuthentication(title: String?, message: String?, handler: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // ユーザ名のテキストフィールドを追加
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "ユーザ名"
            textField.tag = 1
        })

        // パスワードのテキストフィールドを追加
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "パスワード"
            textField.isSecureTextEntry = true
            textField.tag = 2
        })

        return alert
    }
}
