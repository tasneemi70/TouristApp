//
//  TabVC.swift
//  tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//
//


import UIKit
import Firebase
class TabVC: UITabBarController, UITabBarControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
      self.tabBar.tintColor = UIColor.gray // tab bar icon tint color
        //  self.tabBar.isTranslucent = false
         // UITabBar.appearance().barTintColor = UIColor.lightGray // tab bar background color
    delegate = self
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let item1 = HomeVC()
      let item3 = Weather()
      let item6 =  ViewController()
     let item4 =  TikTok()
      let item5 = FavouriteVC()
      let item2 = ProfileVC()
      //tabBar.tintColor = .white
      tabBar.unselectedItemTintColor = .white
    //  tabBar.backgroundColor = .white
    let icon1 = UITabBarItem(title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "contextualmenu.and.cursorarrow"), selectedImage: UIImage(systemName: "contextualmenu.and.cursorarrow"))
      let icon3 = UITabBarItem(title:NSLocalizedString("Weather", comment: "") , image: UIImage(systemName: "cloud"), selectedImage: UIImage(systemName: "cloud.drizzle.fill"))
      let icon6 = UITabBarItem(title: NSLocalizedString("Location", comment: ""), image: UIImage(systemName: "location"), selectedImage: UIImage(systemName: "location.fill"))
      let icon4 = UITabBarItem(title: NSLocalizedString("Video", comment: ""), image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))
      let icon5 = UITabBarItem(title: NSLocalizedString("My List", comment: ""), image: UIImage(systemName: "text.badge.plus"), selectedImage: UIImage(systemName: "list.bullet.circle.fill"))
      let icon2 = UITabBarItem(title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person"))
      item1.tabBarItem = icon1
      item3.tabBarItem = icon3
      item6.tabBarItem = icon6
      item4.tabBarItem = icon4
      item5.tabBarItem = icon5
      item2.tabBarItem = icon2

    let controllers = [item1,item3,item4,item6,item5,item2] //array of the root view controllers displayed by the tab bar interface
    self.viewControllers = controllers
  }
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    print("Should select viewController: \(viewController.title ?? "") ?")
    return true;
  }
}



//HomeVC(),
//           Weather(),
//           ViewController(),
//           TikTok(),
//           ProfileVC(),
//           FavouriteVC()
















//import UIKit
//import FirebaseAuth
//
//
//class TabVC: UITabBarController {
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabBar.backgroundColor = UIColor(named: "Color")
//        hidesBottomBarWhenPushed = false
//        view.backgroundColor = UIColor(named: "Color")
//
//        guard let currentUserId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        UsersService.shared.updateUserInfo(
//            user: User(
//                id: currentUserId,
//                name: "Tasnim",
//                email: ""
//            )
//        )
//
//        viewControllers = [
//           HomeVC(),
//           Weather(),
//           ViewController(),
//           TikTok(),
//           ProfileVC(),
//           FavouriteVC()
//
//        ]
//    }
//}
