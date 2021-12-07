//
//  RegisterVC.swift
//  Tourist

//
//  Created by Tsnim Alqahtani  on 18/04/1443 AH.
//

import UIKit

class HomeVC: UIViewController {
    
    var arabicBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Visitor 🛬", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(arabicButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    var englishBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Share a Place", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    

    var WelcLabel: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.layer.cornerRadius = .maximumMagnitude(20, 20)
        welcome.text = (NSLocalizedString("Welcome to my city", comment: ""))
        welcome.textColor = .darkGray
        welcome.layer.masksToBounds = true
        return welcome
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

     view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        //UIColor(named: "Color")
        var image = UIImage(systemName: "house.circle.fill")
        tabBarItem = .init(title: NSLocalizedString("Home", comment: ""), image: image, selectedImage: image)
    
        
        view.addSubview(arabicBtn)
        view.addSubview(WelcLabel)
        view.addSubview(englishBtn)
       
        NSLayoutConstraint.activate([
            arabicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arabicBtn.self.heightAnchor.constraint(equalToConstant: 50),
            arabicBtn.self.widthAnchor.constraint(equalToConstant: 250),
            arabicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            
            englishBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            englishBtn.self.heightAnchor.constraint(equalToConstant: 50),
            englishBtn.self.widthAnchor.constraint(equalToConstant: 250),
            englishBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
            
            WelcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            WelcLabel.self.heightAnchor.constraint(equalToConstant: 50),
            WelcLabel.self.widthAnchor.constraint(equalToConstant: 250),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
           
           
            
             
        ])
    
    }
    @objc func arabicButtonPressed() {
        let arabicPage = VisitorVC()
        arabicPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(arabicPage, animated: true)
        let alert1 = UIAlertController(
            title: ("Greeting"),message: "WELCOME .... ",preferredStyle: .alert)
        alert1.addAction(UIAlertAction(title: "OK",style: .default,handler: { action in
            print("OK")
        }
                                      )
        )
        present(alert1, animated: true, completion: nil)
    
    }
    
    @objc func englishButtonPressed() {
        let englishPage = ShareVC()
        self.present(englishPage, animated: true)
    }
         
}
