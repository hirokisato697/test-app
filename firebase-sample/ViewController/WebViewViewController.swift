//
//  WebViewViewController.swift
//  firebase-sample
//
//  Created by Hiroki Sato on 2022/09/14.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    private var webView: WKWebView?
    let url: String = "http://leggiero.sakura.ne.jp/xxxxbasic_auth_testxxxx/"
    //let url: String = "http://leggiero.sakura.ne.jp/xxxxbasic_auth_testxxxx/secret/kaiin_page_top.htm"
    //let url: String = "https://www.google.com/"

    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView?.navigationDelegate = self
        self.view = self.webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url: URL = URL(string: self.url) else {
            print("ERROR: no url")
            self.navigationController?.popToRootViewController(animated: false)
            return
        }
        print("URL: \(url.absoluteString)")
        let urlRequest = URLRequest(url: url)
        print(urlRequest.allHTTPHeaderFields)
        self.loadURLRequest(urlRequest)
    }

    private func loadURLRequest(_ request: URLRequest) {
        DispatchQueue.main.async {
                self.webView?.load(request)
        }
    }
}

extension WebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        let alert = UIAlertController.basicAuthentication(title: "Basic認証", message: "ユーザ名とパスワードを入力してください。")

        // ログインボタンの設定
        let okAction = UIAlertAction(title: "ログイン", style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            var user = ""
            var password = ""

            if let textFields = alert.textFields {
                for textField in textFields {
                    if textField.tag == 1 {
                        user = textField.text ?? ""
                    } else if textField.tag == 2 {
                        password = textField.text ?? ""
                    }
                }
            }

            let credential = URLCredential(user: user, password: password, persistence: URLCredential.Persistence.none)
            completionHandler(.useCredential, credential)
        })
        alert.addAction(okAction)

        // キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: {
            (action:UIAlertAction!) -> Void in
            completionHandler(.cancelAuthenticationChallenge, nil)
        })
        alert.addAction(cancelAction)

        // アラートを画面に表示
        present(alert, animated: true, completion: nil)
    }
}


