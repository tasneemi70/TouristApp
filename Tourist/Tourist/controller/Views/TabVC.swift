//
//  TabVC.swift
//  tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//
//
import UIKit
import FirebaseAuth


class TabVC: UITabBarController {



    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(named: "Color")
        hidesBottomBarWhenPushed = false
        view.backgroundColor = UIColor(named: "Color")

        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }

        UsersService.shared.updateUserInfo(
            user: User(
                id: currentUserId,
                name: "Tasnim",
                email: ""
            )
        )

        viewControllers = [
           HomeVC(),
           Weather(),
           ViewController(),
           TikTok(),
           MyProfileVC(),
         //FirstVC()

        ]
    }
}
