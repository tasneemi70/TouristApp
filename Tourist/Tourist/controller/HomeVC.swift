//
//  RegisterVC.swift
//  Tourist

//
//  Created by Tsnim Alqahtani  on 18/04/1443 AH.
//



import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    var arrCollecPhoto = [UIImage(named: "11")!,
                          UIImage(named: "1")! ,
                          UIImage(named: "3")!]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCollecPhoto.count        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
          let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:
            "cell", for: indexPath) as! collectionViewCell
        
            cell.imageC.image = arrCollecPhoto[indexPath.row]
            cell.backgroundColor = .white
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }



    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
             cv.backgroundColor = .lightGray
             return cv
       }()
    var visitorBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Visitor 🛬", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(arabicButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    var sharePlaceBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Share a Place", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    

    var WelcLabel: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.layer.cornerRadius = .maximumMagnitude(20, 20)
        welcome.text = (NSLocalizedString("Welcome to my city", comment: ""))
        welcome.textColor = .darkGray
        welcome.layer.masksToBounds = true
        return welcome
    }()
    
//    var imgHome: UIImageView = {
//        letUICollectionView with standard layoutUICollectionView with standard layout imgView = UIImageView()
//        imgView.image = UIImage(named: "11")
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        return imgView
//    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

     view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        //UIColor(named: "Color")
        var image = UIImage(systemName: "house.circle.fill")
        tabBarItem = .init(title: NSLocalizedString("Home", comment: ""), image: image, selectedImage: image)
    
        
        view.addSubview(visitorBtn)
        view.addSubview(WelcLabel)
        view.addSubview(sharePlaceBtn)
       //view.addSubview(imgHome)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(collectionViewCell.self,
        forCellWithReuseIdentifier: "cell")
        setupCollectionConstraints()
        
        
        func setupCollectionConstraints() {
             collectionView.translatesAutoresizingMaskIntoConstraints = false
             collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
             collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
             collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         }

        
        NSLayoutConstraint.activate([
            visitorBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visitorBtn.self.heightAnchor.constraint(equalToConstant: 70),
            visitorBtn.self.widthAnchor.constraint(equalToConstant: 250),
            visitorBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            
            sharePlaceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sharePlaceBtn.self.heightAnchor.constraint(equalToConstant: 70),
            sharePlaceBtn.self.widthAnchor.constraint(equalToConstant: 250),
            sharePlaceBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            
            WelcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            WelcLabel.self.heightAnchor.constraint(equalToConstant: 50),
            WelcLabel.self.widthAnchor.constraint(equalToConstant: 250),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)])
           
//
//            imgHome.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
//            imgHome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imgHome.heightAnchor.constraint(equalToConstant: 300),
//            imgHome.widthAnchor.constraint(equalTo: imgHome.heightAnchor,multiplier: 100/100)])
//            imgHome.layer.cornerRadius = 100
//
    
    }
    @objc func arabicButtonPressed() {
        let arabicPage = VisitorVC()
        arabicPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(arabicPage, animated: true)
        let alert1 = UIAlertController(
            title: ("Greeting"),message: "WELCOME .... ",preferredStyle: .alert)
        alert1.addAction(UIAlertAction(title: "OK",style: .default,handler: { action in
            print("OK")
        }
                                      )
        )
        present(alert1, animated: true, completion: nil)
    
    }
    
    @objc func englishButtonPressed() {
        let englishPage = ShareVC()
        self.present(englishPage, animated: true)
    }
         
}
