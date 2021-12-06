//
//  LoginVC.swift
//  tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth


class LoginVC: UIViewController, UITextFieldDelegate {
    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.text = ""
        tf.placeholder = (NSLocalizedString("Enter Email ..", comment: ""))
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        return tf
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        tf.text = ""
        tf.placeholder =  (NSLocalizedString("Enter Password ...", comment: ""))
        return tf
    }()
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(red: 89/255, green: 128/255, blue: 148/255, alpha: 1.5)
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    //CGRect(red: 230/255, green: 237/255, blue: 184/255, alpha: 1).cgColor
    
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(red: 89/255, green: 128/255, blue: 148/255, alpha: 1)
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()
    var imgUser: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "11")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
            return true
        }
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imgUser)
        
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        
        NSLayoutConstraint.activate([
            imgUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imgUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgUser.heightAnchor.constraint(equalToConstant: 300),
            imgUser.widthAnchor.constraint(equalTo: imgUser.heightAnchor,multiplier: 100/100)])
//        imgUser.layer.cornerRadius = 100
        setupGradientView()
        view.backgroundColor = .white
        
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 24),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupGradientView() {
        let _ = GradientView(self)
    }
    
    @objc func registerBtnPressed() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            let newvc2 = TabVC()
              newvc2.navigationItem.largeTitleDisplayMode = .never
              self.navigationController?.pushViewController(newvc2, animated: true)
        }
        
    }
    @objc func loginBtnPressed() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
          let newvc1 = TabVC()
            newvc1.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.viewControllers = [newvc1]
          
            
        }
        
    }
}
