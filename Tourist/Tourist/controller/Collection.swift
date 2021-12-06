//
//  Collection.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 26/04/1443 AH.
//
//
//import UIKit
//
//class FirstVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    var PlaceImage9 = UIImage(named: "a2")
//
//
//    var PlaceImage9: UIImageView = {
//     let PlaceImage90 = UIImageView()
//        PlaceImage90.layer.borderWidth = 1
//        PlaceImage90.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
//        PlaceImage90.layer.cornerRadius = 20
//        PlaceImage90.contentMode = .scaleAspectFill
//        PlaceImage90.clipsToBounds = true
//        PlaceImage90.backgroundColor = .systemTeal
//     return PlaceImage90
//   }()
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//
//        var image = UIImage(systemName: "house.circle.fill")
//        tabBarItem = .init(title: "Home", image: image, selectedImage: image)
//
//        view.backgroundColor = .white
//        view.addSubview(PlaceImage9)
//
//        view.addSubview(collectionView)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(UICollectionViewCell.self,
//        forCellWithReuseIdentifier: "cell")
//        setupCollectionConstraints()
//    }
//
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .lightGray
//        return cv
//    }()
//
//    func setupCollectionConstraints() {
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .white
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: 100)
//
//    PlaceImage9.frame = CGRect(x: 10,
//              y: 10 ,
//              width: 190,
//              height: 200)
//}
//}
//
