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
        restuBtn.addTarget(self, action: #selector(RestButtonPressed), for: .touchUpInside)
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
        naturalBtn.addTarget(self, action: #selector(NaturalButtonPressed), for: .touchUpInside)
        naturalBtn.layer.cornerRadius = 25
        naturalBtn.layer.masksToBounds = true
        return naturalBtn
    }()
    
    var hotelsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 100
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(NSLocalizedString("Hotels", comment: ""), for: .normal)

        btn.setImage(UIImage(named: "parks"), for: .normal)
        btn.backgroundColor = UIColor(named: "Color")
        btn.addTarget(self, action: #selector(HotelPage), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
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
    
    var nameGroup: UILabel = {
        let nameGroup = UILabel()
        nameGroup.translatesAutoresizingMaskIntoConstraints = false
        nameGroup.layer.cornerRadius = .maximumMagnitude(30, 20)
        nameGroup.text = (NSLocalizedString("Hotels", comment: ""))
        nameGroup.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
        nameGroup.textAlignment = .center
        nameGroup.backgroundColor = UIColor(named: "Color")
        nameGroup.layer.cornerRadius = 20
        nameGroup.translatesAutoresizingMaskIntoConstraints =
        nameGroup.textColor == UIColor(named: "Color")
        nameGroup.layer.masksToBounds = true
        return nameGroup
    }()
    var nameGroup1: UILabel = {
        let nameGroup1 = UILabel()
        nameGroup1.translatesAutoresizingMaskIntoConstraints = false
        nameGroup1.layer.cornerRadius = .maximumMagnitude(30, 20)
        nameGroup1.text = (NSLocalizedString("Coffee Shop", comment: ""))
        nameGroup1.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
        nameGroup1.textAlignment = .center
        nameGroup1.backgroundColor = UIColor(named: "Color")
        nameGroup1.layer.cornerRadius = 20
        nameGroup1.translatesAutoresizingMaskIntoConstraints =
        nameGroup1.textColor == UIColor(named: "Color")
        nameGroup1.layer.masksToBounds = true
        return nameGroup1
    }()


    var nameGroup2: UILabel = {
        let nameGroup2 = UILabel()
        nameGroup2.translatesAutoresizingMaskIntoConstraints = false
        nameGroup2.layer.cornerRadius = .maximumMagnitude(30, 20)
        nameGroup2.text = (NSLocalizedString("Resturants", comment: ""))
        nameGroup2.font = UIFont(name: "AvenirNextCondensed-Medium", size:    16.0)
        nameGroup2.textAlignment = .center
        nameGroup2.backgroundColor = UIColor(named: "Color")
        nameGroup2.layer.cornerRadius = 20
        nameGroup2.translatesAutoresizingMaskIntoConstraints =
        nameGroup2.textColor == UIColor(named: "Color")
        nameGroup2.layer.masksToBounds = true
        return nameGroup2
    }()
    var nameGroup3: UILabel = {
        let nameGroup3 = UILabel()
        nameGroup3.translatesAutoresizingMaskIntoConstraints = false
        nameGroup3.layer.cornerRadius = .maximumMagnitude(30, 20)
        nameGroup3.text = (NSLocalizedString("Natural Places", comment: ""))
        nameGroup3.font = UIFont(name: "AvenirNextCondensed-Medium", size:    16.0)
        nameGroup3.textAlignment = .center
        nameGroup3.backgroundColor = UIColor(named: "Color")
        nameGroup3.layer.cornerRadius = 20
        nameGroup3.translatesAutoresizingMaskIntoConstraints =
        nameGroup3.textColor == UIColor(named: "Color")
        nameGroup3.layer.masksToBounds = true
        return nameGroup3
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = arrCollecPhoto.count
        startTimer()
        setGradientBackground()

        view.backgroundColor = UIColor(    #colorLiteral(red: 0.7699097991, green: 0.661706686, blue: 0.7322302461, alpha: 1)   )
        let image = UIImage(systemName: "house.circle.fill")
        tabBarItem = .init(title: NSLocalizedString("Home", comment: ""), image: image, selectedImage: image)
    
        
        view.addSubview(coffeeBtn)
        view.addSubview(restuBtn)
        view.addSubview(WelcLabel)
        view.addSubview(nameGroup)
        view.addSubview(nameGroup1)
        view.addSubview(nameGroup2)
        view.addSubview(nameGroup3)


        view.addSubview(hotelsBtn)
//        view.addSubview(LakesBtn)
        view.addSubview(collectionView)
        view.addSubview(naturalBtn)
//        view.addSubview(cableCarBtn)
        
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
            coffeeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            
            hotelsBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            hotelsBtn.self.heightAnchor.constraint(equalToConstant: 100),
            hotelsBtn.self.widthAnchor.constraint(equalToConstant: 170),
            hotelsBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 605),
        
            
            naturalBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 95),
            naturalBtn.self.heightAnchor.constraint(equalToConstant: 100),
            naturalBtn.self.widthAnchor.constraint(equalToConstant: 170),
            naturalBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 605),
            
            restuBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 95),
            restuBtn.self.heightAnchor.constraint(equalToConstant: 100),
            restuBtn.self.widthAnchor.constraint(equalToConstant: 170),
            restuBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            
            WelcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            WelcLabel.self.heightAnchor.constraint(equalToConstant: 50),
            WelcLabel.self.widthAnchor.constraint(equalToConstant: 250),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),

            nameGroup1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            nameGroup1.self.heightAnchor.constraint(equalToConstant: 30),
            nameGroup1.self.widthAnchor.constraint(equalToConstant: 100),
            nameGroup1.topAnchor.constraint(equalTo: coffeeBtn.bottomAnchor, constant: 2),
            
            nameGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            nameGroup.self.heightAnchor.constraint(equalToConstant: 30),
            nameGroup.self.widthAnchor.constraint(equalToConstant: 100),
            nameGroup.topAnchor.constraint(equalTo: hotelsBtn.bottomAnchor, constant: 2),
            
         
            nameGroup3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            nameGroup3.self.heightAnchor.constraint(equalToConstant: 30),
            nameGroup3.self.widthAnchor.constraint(equalToConstant: 100),
            nameGroup3.topAnchor.constraint(equalTo: naturalBtn.bottomAnchor, constant: 2),


            nameGroup2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            nameGroup2.self.heightAnchor.constraint(equalToConstant: 30),
            nameGroup2.self.widthAnchor.constraint(equalToConstant: 100),
            nameGroup2.topAnchor.constraint(equalTo: restuBtn.bottomAnchor, constant: 2),
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
    @objc func RestButtonPressed() {
        let RestPage = ResturantVC()
        RestPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(RestPage, animated: true)
        
    }
   
    @objc func HotelPage() {
        let HotelPage = HotelVC()
        HotelPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(HotelPage, animated: true)
    }
    
    @objc func NaturalButtonPressed() {
        let NaturalPage = NaturallVC()
        NaturalPage.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(NaturalPage, animated: true)
    }

}

