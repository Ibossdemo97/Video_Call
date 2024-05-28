//
//  SIgnInViewController.swift
//  FakeFacetime
//
//  Created by Nhấc tay khỏi Mac của tao on 21/5/24.
//

import UIKit

class SIgnInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        title = "Đăng nhập"
        emailTextField.text = "abc123@gmail.com"
        passwordTextField.text = "123456"
    }


    
    @IBAction func tapOnLoginButton(_ sender: Any) {
        guard let emailString = emailTextField.text, let passString = passwordTextField.text else {
            return
        }
//        AuthManager.shared.signIn(email: emailString, password: passString) { done in
//            if done {
//                let vc = UINavigationController(rootViewController: FacetimeViewController())
//                vc.modalPresentationStyle = .overFullScreen
//                self.present(vc, animated: true)
//            } else {
//                self.emailTextField.text = ""
//                self.passwordTextField.text = ""
//                let alert = UIAlertController(title: "Sai", message: "Again", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Done", style: .cancel))
//                self.present(alert, animated: true)
//            }
//        }
        AuthManager.shared.signInHardCode(email: emailString, password: passString) { [weak self] done in
            if done {
                let vc = FacetimeViewController()
                vc.modalPresentationStyle = .automatic
                self?.present(vc, animated: true)
            } else {
                
            }
        }
    }
    
    @IBAction func taoOnRegisterButton(_ sender: Any) {
//        guard let emailString = emailTextField.text, let passString = passwordTextField.text else {
//            return
//        }
//        AuthManager.shared.signUp(email: emailString, password: passString) { [weak self] done in
//            guard done else {
//                return
//            }
//            let alert = UIAlertController(title: "Thành công", message: "Hãy đăng nhập", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OKay", style: .cancel))
//            self?.present(alert, animated: true)
//
//        }
    }
}
