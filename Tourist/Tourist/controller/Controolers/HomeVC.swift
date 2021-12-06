//
//  RegisterVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit

class HomeVC: UIViewController {
    
    var arabicBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Arabic", for: .normal)
        btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        btn.addTarget(self, action: #selector(arabicButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    var englishBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("English", for: .normal)
        btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let image = UIImage(systemName: "homekit")
        tabBarItem = .init(title: "Home", image: image, selectedImage: image)
        
        view.addSubview(arabicBtn)
        view.addSubview(englishBtn)
        NSLayoutConstraint.activate([
            arabicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arabicBtn.self.heightAnchor.constraint(equalToConstant: 170),
            arabicBtn.self.widthAnchor.constraint(equalToConstant: 170),
            arabicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            
            englishBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            englishBtn.self.heightAnchor.constraint(equalToConstant: 170),
            englishBtn.self.widthAnchor.constraint(equalToConstant: 170),
            englishBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 420)
        
        
        ])
    }
    
    @objc func arabicButtonPressed() {
        let arabicPage = ArabicVC()
        self.present(arabicPage, animated: true)
    }
    
    @objc func englishButtonPressed() {
        let englishPage = EnglishVC()
        self.present(englishPage, animated: true)
    }
}
