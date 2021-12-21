////
////  Tourist
////
////  Created by Tsnim Alqahtani  on 18/04/1443 AH.
////
//
//import UIKit
//
//

import UIKit


class NaturallVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    var searchPlace: Array<abhPlace> = naturalList
    
    var c : abhPlace?
    
    lazy var searchBar:UISearchBar = UISearchBar()
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
     let title1 : UILabel = {
        let titlelabel = UILabel()
        titlelabel.text = NSLocalizedString("ABHA CITY ", comment: "")
        titlelabel.font = UIFont(name: "AvenirNextCondensed-Medium", size: 23.0)
        titlelabel.textColor = .white
        titlelabel.textAlignment = .center
         titlelabel.backgroundColor = UIColor(  #colorLiteral(red: 0.1437019706, green: 0.1230279282, blue: 0.4485198259, alpha: 0.9251603891)        )
        titlelabel.layer.cornerRadius = 100
        titlelabel.layer.masksToBounds = true
        titlelabel.translatesAutoresizingMaskIntoConstraints = false

        return titlelabel

    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        setGradientBackground()

        if #available(iOS 15, *) {
             let appearance = UINavigationBarAppearance()
             appearance.configureWithOpaqueBackground()
   //          appearance.backgroundColor = < your tint color >
             navigationController?.navigationBar.standardAppearance = appearance;
             navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
           }
        
        view.addSubview(collectionView)
        view.addSubview(title1)
       // view.addSubview(favButton)
        collectionView.delegate = self
        collectionView.dataSource = self
    collectionView.register(NaturalCell.self,  forCellWithReuseIdentifier:"CellN")
        setupCollectionConstraints()
        
        collectionView.frame = view.bounds
        collectionView.reloadData()
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder =  NSLocalizedString(" Search...", comment: "")
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar

        NSLayoutConstraint.activate([
            title1.widthAnchor.constraint(equalToConstant: -100),
            title1.heightAnchor.constraint(equalToConstant: 50),
            title1.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            title1.leftAnchor.constraint(equalTo: view.leftAnchor,constant: -50),
            title1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),

        ])
            
        
       
        
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame:.zero , collectionViewLayout: layout)
        cv.backgroundColor = .white
        
        return cv
    }()
    
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchPlace.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell2  = collectionView.dequeueReusableCell(withReuseIdentifier: "CellN", for: indexPath) as! NaturalCell
        
        
        cell2.setCell(placeR: searchPlace[indexPath.item])
//
        cell2.backgroundColor = .white
        cell2.layer.cornerRadius = 35
        return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty {
            searchPlace = naturalList
        } else {
            searchPlace = naturalList.filter({oneplace in
                return oneplace.name.starts(with: searchText)
            })
        }
        collectionView.reloadData()
    
    
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC1 = NaturalDetailsCell()
        newVC1.title = c?.placeA[indexPath.row].PlaceName
        newVC1.PlacesC = naturalList[indexPath.row]
        newVC1.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC1, animated: true)
    }
    
   
    
}


