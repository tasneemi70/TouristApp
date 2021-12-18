//
//  RegisterVC.swift
//  Tourist

//
//  Created by Tsnim Alqahtani  on 18/04/1443 AH.
//



import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentCellIndex = 0
        var timer :Timer?
var pageControl = UIPageControl()
    struct Home {
        var photo: UIImage
        
    }
    var arrCollecPhoto = [Home(photo: UIImage(named: "ab1")!),
                          Home(photo: UIImage(named: "ab2")!),
                          Home(photo: UIImage(named: "ab3")!),
                          Home(photo: UIImage(named: "ab1")!),
                          Home(photo: UIImage(named: "ab2")!),
                          Home(photo: UIImage(named: "ab3")!),
                          Home(photo: UIImage(named: "ab2")!),
                          Home(photo: UIImage(named: "ab3")!),
                          Home(photo: UIImage(named: "ab1")!),
                          Home(photo: UIImage(named: "ab2")!),
                          Home(photo: UIImage(named: "ab3")!),

                             ]

    

    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.layer.cornerRadius = 30

             cv.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
             return cv
       }()
    var coffeeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 100
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Coffee ", comment: ""), for: .normal)
        btn.setImage(UIImage(named: "Cofffe"), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(coffeeButtonPressed), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()

    var restuBtn: UIButton = {
        let restuBtn = UIButton()
        restuBtn.translatesAutoresizingMaskIntoConstraints = false
        restuBtn.layer.cornerRadius = 100
        restuBtn.setTitleColor(.black, for: .normal)
        restuBtn.setTitle(NSLocalizedString("Coffee ", comment: ""), for: .normal)
        restuBtn.setImage(UIImage(named: "Rest"), for: .normal)
        restuBtn.backgroundColor = UIColor(named: "Color")
       // restuBtn.addTarget(self, action: #selector(coffeeButtonPressed), for: .touchUpInside)
        restuBtn.layer.cornerRadius = 25
        restuBtn.layer.masksToBounds = true
        return restuBtn
    }()
    var naturalBtn: UIButton = {
        let naturalBtn = UIButton()
        naturalBtn.translatesAutoresizingMaskIntoConstraints = false
        naturalBtn.layer.cornerRadius = 100
        naturalBtn.setTitleColor(.black, for: .normal)
        naturalBtn.setTitle(NSLocalizedString("Coffee ", comment: ""), for: .normal)
        naturalBtn.setImage(UIImage(named: "sdh"), for: .normal)
        naturalBtn.backgroundColor = UIColor(named: "Color")
       // naturalBtn.addTarget(self, action: #selector(coffeeButtonPressed), for: .touchUpInside)
        naturalBtn.layer.cornerRadius = 25
        naturalBtn.layer.masksToBounds = true
        return naturalBtn
    }()
    
    var ParksBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 100
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Parks", comment: ""), for: .normal)

        btn.setImage(UIImage(named: "parks"), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
      //  btn.addTarget(self, action: #selector(ParksPage), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    var LakesBtn: UIButton = {
        let LakesBtn = UIButton()
        LakesBtn.translatesAutoresizingMaskIntoConstraints = false
        LakesBtn.layer.cornerRadius = 100
        LakesBtn.setTitleColor(.black, for: .normal)
        LakesBtn.setTitle(NSLocalizedString("Coffee ", comment: ""), for: .normal)
        LakesBtn.setImage(UIImage(named: "lake"), for: .normal)
        LakesBtn.backgroundColor = UIColor(named: "Color")
      //  LakesBtn.addTarget(self, action: #selector(coffeeButtonPressed), for: .touchUpInside)
        LakesBtn.layer.cornerRadius = 25
        LakesBtn.layer.masksToBounds = true
        return LakesBtn
    }()
    var cableCarBtn: UIButton = {
        let cableCarBtn = UIButton()
        cableCarBtn.translatesAutoresizingMaskIntoConstraints = false
        cableCarBtn.layer.cornerRadius = 100
        cableCarBtn.setTitleColor(.black, for: .normal)
        cableCarBtn.setTitle(NSLocalizedString("Parks", comment: ""), for: .normal)

        cableCarBtn.setImage(UIImage(named: "cable"), for: .normal)
        cableCarBtn.backgroundColor = UIColor(named: "Color")
      //  cableCarBtn.addTarget(self, action: #selector(ParksPage), for: .touchUpInside)
        cableCarBtn.layer.cornerRadius = 25
        cableCarBtn.layer.masksToBounds = true
        return cableCarBtn
    }()
    var WelcLabel: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.layer.cornerRadius = .maximumMagnitude(30, 20)
        welcome.text = (NSLocalizedString("         Welcome to Abha city ", comment: ""))
        welcome.textColor = .darkGray
        welcome.layer.masksToBounds = true
        return welcome
    }()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = arrCollecPhoto.count
                startTimer()
  setGradientBackground()

     view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        //UIColor(named: "Color")
        var image = UIImage(systemName: "house.circle.fill")
        tabBarItem = .init(title: NSLocalizedString("Home", comment: ""), image: image, selectedImage: image)
    
        
        view.addSubview(coffeeBtn)
        view.addSubview(restuBtn)
        view.addSubview(WelcLabel)
      //  view.addSubview(TLabel)

        view.addSubview(ParksBtn)
        view.addSubview(LakesBtn)
        view.addSubview(collectionView)
        view.addSubview(naturalBtn)
        view.addSubview(cableCarBtn)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(collectionViewCell.self, forCellWithReuseIdentifier: collectionViewCell.identfire)
        setupCollectionConstraints()
        
        
        func setupCollectionConstraints() {
             collectionView.translatesAutoresizingMaskIntoConstraints = false
             collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
             collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
             collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         }

        
          NSLayoutConstraint.activate([
            coffeeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -95),
            coffeeBtn.self.heightAnchor.constraint(equalToConstant: 100),
            coffeeBtn.self.widthAnchor.constraint(equalToConstant: 170),
            coffeeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            
            ParksBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            ParksBtn.self.heightAnchor.constraint(equalToConstant: 100),
            ParksBtn.self.widthAnchor.constraint(equalToConstant: 170),
            ParksBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            
            LakesBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 95),
            LakesBtn.self.heightAnchor.constraint(equalToConstant: 100),
            LakesBtn.self.widthAnchor.constraint(equalToConstant: 170),
            LakesBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            
            cableCarBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            cableCarBtn.self.heightAnchor.constraint(equalToConstant: 100),
            cableCarBtn.self.widthAnchor.constraint(equalToConstant: 170),
            cableCarBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            
            naturalBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 95),
            naturalBtn.self.heightAnchor.constraint(equalToConstant: 100),
            naturalBtn.self.widthAnchor.constraint(equalToConstant: 170),
            naturalBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            
            restuBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 95),
            restuBtn.self.heightAnchor.constraint(equalToConstant: 100),
            restuBtn.self.widthAnchor.constraint(equalToConstant: 170),
            restuBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            
            WelcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            WelcLabel.self.heightAnchor.constraint(equalToConstant: 50),
            WelcLabel.self.widthAnchor.constraint(equalToConstant: 250),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),

          ])
    }
    @objc func moveToNextIndex(){
                if currentCellIndex < arrCollecPhoto.count - 1{
                    currentCellIndex += 1
                }else{
                    currentCellIndex = 0
                }
                
               
                collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
                pageControl.currentPage = currentCellIndex
            }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCollecPhoto.count
        
    }
    func startTimer() {
                timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
                
            }
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
    @objc func coffeeButtonPressed() {
        let coffePage = CoffeeVC()
        coffePage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(coffePage, animated: true)

    
    }

//    @objc func sharePlaceButtonPressed() {
//        let sharePlacePage = ParksVC()
//        self.present(sharePlacePage, animated: true)
    
    @objc func ParksPage() {
        let ParksPage = ParksVC()
        ParksPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(ParksPage, animated: true)
    }
//    @objc func coffePage() {
//        let coffePage = CofffeeVC()
//        coffePage.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(coffePage, animated: true)
}
