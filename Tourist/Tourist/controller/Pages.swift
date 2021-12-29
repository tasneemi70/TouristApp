//
//  Pages.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 25/05/1443 AH.
//

import UIKit

class PageController: UIViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageController: UIPageViewController!
    var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .pageCurl , navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self

        addChild(pageController)
        view.addSubview(pageController.view)

        let views = ["pageController": pageController.view] as [String: AnyObject]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))

        
        let vc1 = HomeVC()
        let vc2 = Weather()
        let vc3 = FavouriteVC()
        let vc4 = ProfileVC()
        
        controllers.append(vc2)
        controllers.append(vc3)
        controllers.append(vc4)
        controllers.append(vc1)
        

    pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
                  if index > 0 {
                      return controllers[index - 1]
                  } else {
                      return nil
                  }
              }

              return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
                   if index < controllers.count - 1 {
                       return controllers[index + 1]
                   } else {
                       return nil
                   }
               }

               return nil
    }
    
}


