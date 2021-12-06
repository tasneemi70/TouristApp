//
//  ArabicVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit


class ArabicVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ArabicCell.self,
        forCellWithReuseIdentifier: "cell")
        setupCollectionConstraints()
        
        collectionView.frame = view.bounds
        
        
      
    }
    let collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          layout.minimumLineSpacing = 5
          layout.minimumInteritemSpacing = 5
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.backgroundColor = .white
         
           return cv
       }()
    
    
  
    
    func setupCollectionConstraints() {
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
          collectionView.heightAnchor.constraint(equalToConstant: 550).isActive = true
          collectionView.widthAnchor.constraint(equalToConstant: 350).isActive = true
          collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
          collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArabicCell
        cell.setCell(book: bookList[indexPath.item])
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 35
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 250)
      }

}
