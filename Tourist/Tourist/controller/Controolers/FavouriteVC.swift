//
//  FavouriteVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit


class FavouriteVC : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let image = UIImage(systemName: "star.fill")
        tabBarItem = .init(title: "Favourite", image: image, selectedImage: image)
        
    }
}
