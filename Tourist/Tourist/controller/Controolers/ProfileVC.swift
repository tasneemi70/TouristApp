//
//  ProfileVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        let image = UIImage(systemName: "person.crop.circle")
        tabBarItem = .init(title: "Profile", image: image, selectedImage: image)
        
    }
    
}

