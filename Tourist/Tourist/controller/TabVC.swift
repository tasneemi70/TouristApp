//
//  ViewController.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//
//

import UIKit
import FirebaseAuth


class TabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
//
//        UsersService.shared.updateUserInfo(
//            user: User(
//                id: currentUserId,
//                name: "Hadi",
//                status: "Online"
//            )
//        )
//
        viewControllers = [
            MealViewController(),
            LoginVC()
        ]
    }
    
}
