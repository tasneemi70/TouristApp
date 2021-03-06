//
//  HotelsVC.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 16/05/1443 AH.
//

import UIKit


class HotelVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    var searchPlace: Array<abhPlace> = hotelsList
    
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
         titlelabel.backgroundColor = UIColor( #colorLiteral(red: 0.6971340775, green: 0.7144420743, blue: 0.7253066897, alpha: 1))
        titlelabel.layer.cornerRadius = 100
        titlelabel.layer.masksToBounds = true
        titlelabel.translatesAutoresizingMaskIntoConstraints = false

        return titlelabel

    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(    #colorLiteral(red: 0.7699097991, green: 0.661706686, blue: 0.7322302461, alpha: 1)   )

        setGradientBackground()

        if #available(iOS 15, *) {
             let appearance = UINavigationBarAppearance()
             appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(  #colorLiteral(red: 0.08766946942, green: 0.2745897174, blue: 0.3569372594, alpha: 0.4541080298) )
             navigationController?.navigationBar.standardAppearance = appearance;
             navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
           }
        
        view.addSubview(collectionView)
        view.addSubview(title1)
       // view.addSubview(favButton)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HotelCell.self,forCellWithReuseIdentifier: "CellH")
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
        cv.backgroundColor = UIColor(named: "setGradientBackground")

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
        
        let cell2  = collectionView.dequeueReusableCell(withReuseIdentifier: "CellH", for: indexPath) as! HotelCell
        
        
        cell2.setCell(placeR: searchPlace[indexPath.item])
//
        cell2.layer.cornerRadius = 35
        return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty {
            searchPlace = hotelsList
        } else {
            searchPlace = hotelsList.filter({oneplace in
                return oneplace.name.starts(with: searchText)
            })
        }
        collectionView.reloadData()
    
    
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC1 = CoffeeDetailsVC()
        newVC1.title = c?.placeA[indexPath.row].PlaceName
        newVC1.PlacesC = hotelsList[indexPath.row]
        newVC1.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC1, animated: true)
    }
    
   
    
}


