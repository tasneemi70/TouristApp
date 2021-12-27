//
//  FavoriteVC.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 05/05/1443 AH.
//

import UIKit
import FirebaseFirestore

class FavouriteVC : UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    
    var APlace: Array<FavVisitor> = []
    
    var selectedIndex = -1

    
    lazy  var placeTV: UITableView = {
          let tableV = UITableView()
          tableV.translatesAutoresizingMaskIntoConstraints = false
          tableV.delegate = self
          tableV.dataSource = self
          tableV.register(FavouriteCell.self, forCellReuseIdentifier: "Fav")
          tableV.isHidden = false
          tableV.backgroundColor = UIColor(named: "setGradientBackground")
          
          return tableV
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        FavoriteServiceVisitor.shared.listenToFavoritePlace { cartFromFS in
            self.APlace = cartFromFS
            self.placeTV.reloadData()
            
        }
//        view.backgroundColor = UIColor(named: "setGradientBackground")
        self.title = NSLocalizedString("My List", comment: "")
        view.reloadInputViews()
        
        view.addSubview(placeTV)
        NSLayoutConstraint.activate([
            placeTV.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            placeTV.heightAnchor.constraint(equalToConstant: 100),
            placeTV.widthAnchor.constraint(equalToConstant: -100),
            placeTV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            placeTV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            placeTV.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
        ])
        
        
        FavoriteServiceVisitor.shared.listenToFavoritePlace { favPlace in
                       self.APlace = favPlace
                       self.placeTV.reloadData()
            
        }
        
    

 //  var image = UIImage(systemName: "like2")
//        let image = UIImage(systemName: "checkmark.seal.fill")
//                           tabBarItem = .init(title: NSLocalizedString("My List", comment: ""), image: image, selectedImage: image)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Fav", for: indexPath) as! FavouriteCell
        
        let a = APlace[indexPath.row]
        
        cell.nameLabel2.text = a.name
        cell.placeImage2.image = UIImage(named: a.image)
        cell.backgroundColor =  UIColor( #colorLiteral(red: 0.0111169992, green: 0.1637375057, blue: 0.2295970917, alpha: 1) )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
          return 354
        }else {
          return 190
        }
      }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        
        let cell = APlace[indexPath.row]
        let alertcontroller = UIAlertController(title: "Delete Place"
                                                , message: "Are you sure?"
                                                , preferredStyle: UIAlertController.Style.alert
        )
        
              alertcontroller.addAction(
                      UIAlertAction(title: "cancel",
                                    style: UIAlertAction.Style.default,
                                    handler: { Action in print("...")
            })
            
        )
        
        alertcontroller.addAction(
            UIAlertAction(title: "Delete",
                          style: UIAlertAction.Style.destructive,
                          handler: { Action in
                if editingStyle == .delete {
                    
                 Firestore.firestore().collection("Favorite").document(cell.name).delete()
                    
                }
                              
                self.placeTV.reloadData()
            })
            
        )
        
        self.present(alertcontroller, animated: true, completion: nil)
    
    }
}

 
