//
//  RegisterVC.swift
//  Tourist

//
//  Created by Tsnim Alqahtani  on 18/04/1443 AH.
//



import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    var timer = Timer()
//   var animationIndex = 1
//


    struct Home {
        var photo: UIImage

    }
    var arrCollecPhoto = [Home(photo: UIImage(named: "ab1")!),
                          Home(photo: UIImage(named: "ab2")!),
                          Home(photo: UIImage(named: "ab3")!),
                             ]


    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
             return cv
       }()
 
    var visitorBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 100
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Visitor 🛬", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(red: 194/255, green: 201/255, blue: 203/255, alpha: 1)
        btn.addTarget(self, action: #selector(arabicButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    var sharePlaceBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 100
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Share a Place", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(red: 194/255, green: 201/255, blue: 203/255, alpha: 1)
        btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    

    var WelcLabel: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.layer.cornerRadius = .maximumMagnitude(20, 20)
        welcome.text = (NSLocalizedString("         Welcome to Abha city ", comment: ""))
        welcome.textColor = .darkGray
        welcome.layer.masksToBounds = true
        return welcome
    }()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  setGradientBackground()

     view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        //UIColor(named: "Color")
        var image = UIImage(systemName: "house.circle.fill")
        tabBarItem = .init(title: NSLocalizedString("Home", comment: ""), image: image, selectedImage: image)
    
        
        view.addSubview(visitorBtn)
        view.addSubview(WelcLabel)
        view.addSubview(sharePlaceBtn)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(collectionViewCell.self, forCellWithReuseIdentifier: collectionViewCell.identfire)
        setupCollectionConstraints()
        
        
        func setupCollectionConstraints() {
             collectionView.translatesAutoresizingMaskIntoConstraints = false
             collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
             collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
             collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         }

        
        NSLayoutConstraint.activate([
            visitorBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 95),
            visitorBtn.self.heightAnchor.constraint(equalToConstant: 170),
            visitorBtn.self.widthAnchor.constraint(equalToConstant: 170),
            visitorBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            
            sharePlaceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            sharePlaceBtn.self.heightAnchor.constraint(equalToConstant: 170),
            sharePlaceBtn.self.widthAnchor.constraint(equalToConstant: 170),
            sharePlaceBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            
            
            WelcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            WelcLabel.self.heightAnchor.constraint(equalToConstant: 50),
            WelcLabel.self.widthAnchor.constraint(equalToConstant: 250),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)])
//
//        CallUsBtn.topAnchor.constraint(equalTo: RentCarBtn.bottomAnchor,constant: 20).isActive = true
//        CallUsBtn.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 20).isActive = true
//        CallUsBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        CallUsBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCollecPhoto.count        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCell.identfire, for: indexPath) as! collectionViewCell
            
            let data = arrCollecPhoto[indexPath.row]
        
            cell.imageC.image = data.photo
            cell.backgroundColor = UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    @objc func arabicButtonPressed() {
        let arabicPage = VisitorVC()
        arabicPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(arabicPage, animated: true)

    
    }
    
    @objc func englishButtonPressed() {
        let englishPage = ShareVC()
        self.present(englishPage, animated: true)
    }

      }

