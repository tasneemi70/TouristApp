//
//  CoffeeVC.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//
import UIKit
import Firebase
import FirebaseFirestore



class CoffeeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
 
    var searchPlace: Array<abhPlace> = coffeelist
    
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
         titlelabel.backgroundColor = UIColor(   #colorLiteral(red: 0.6843472719, green: 0.7290751934, blue: 0.7528939843, alpha: 1)     )
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoffeeCell.self,
                                forCellWithReuseIdentifier: "Cell")
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
        // right cell
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
        
        let cell2  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoffeeCell
        
        
          cell2.setCell(placeC: searchPlace[indexPath.item])
         cell2.layer.cornerRadius = 35
         return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty {
            searchPlace = coffeelist
        } else {
            searchPlace = coffeelist.filter({oneplace in
                return oneplace.name.starts(with: searchText)
            })
        }
        collectionView.reloadData()
    
    
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC1 = CoffeeDetailsVC()
        newVC1.title = c?.placeA[indexPath.row].PlaceName
        newVC1.PlacesC = coffeelist[indexPath.row]
        newVC1.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC1, animated: true)
        
    }
}

class CoffeeCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "Cell"
    var placeC: abhPlace!
    var isActive: Bool = false
    let peopleC: [abhPlace] = []

    private let placeImageC: UIImageView = {
        let placeImageC = UIImageView()
        placeImageC.image = UIImage(named: "a1")
        placeImageC.layer.cornerRadius = 20
        placeImageC.backgroundColor = .systemTeal

        return placeImageC
    }()

    private let nameCoffee: UILabel = {
        let nameCoffee = UILabel()
        nameCoffee.text = ""
        nameCoffee.textColor = .darkGray
        nameCoffee.textAlignment = .right
        nameCoffee.backgroundColor = UIColor(red: 0.6468747258, green: 0.6789115071, blue: 0.7230498195, alpha: 1)
        nameCoffee.layer.cornerRadius = 0
        nameCoffee.layer.masksToBounds = true

        return nameCoffee

    }()


    private let favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "like"), for: .normal)
        button.addTarget(self, action: #selector(addfavoritePlace), for: .touchUpInside)
        return button
    }()

    @objc func addfavoritePlace() {

        if isActive {
            isActive = false
            favButton.setImage(UIImage(named: "like"), for: .normal)
        } else {

               isActive = true
                favButton.setImage(UIImage(named: "like2"), for: .normal)

        }

        let CoffeeName = nameCoffee.text ?? ""
        _ = placeImageC.image ?? UIImage(systemName: "house")
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavVisitor(image: placeC.image, name: CoffeeName, id: placeC.id))
    }

    func setCell(placeC: abhPlace) {
        placeImageC.image = UIImage(named: placeC.image)
        nameCoffee.text = placeC.name
        self.placeC = placeC

    }

    //MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(placeImageC)
        contentView.addSubview(nameCoffee)
        contentView.addSubview(favButton)
        contentView.clipsToBounds = true



    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down

        placeImageC.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameCoffee.frame = CGRect(x: -60 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)


    }

}

