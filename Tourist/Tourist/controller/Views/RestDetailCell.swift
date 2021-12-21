////
////  PlaceDetailVCl.swift
////  Tourist
////
////  Created by Tsnim Alqahtani on 22/04/1443 AH.
////
//
//

import UIKit

class RestDetailsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var Places: abhPlace?
    var PlacesC: abhPlace?

    
  lazy var tableView2: UITableView = {
    let table = UITableView()
      table.translatesAutoresizingMaskIntoConstraints = false
      table.delegate = self
      table.dataSource = self
      table.register(ResturantDetailsCell.self, forCellReuseIdentifier: ResturantCell.identfir)
    return table
   }()
    
    
    let sharePlace: UIButton = {
       let share = UIButton()
      
        share.translatesAutoresizingMaskIntoConstraints = false
        share.setTitleColor(.darkGray, for: .normal)
        share.setImage(UIImage(named: "send"), for: .normal)
       // share.setTitle("       Send", for: .normal)
      //  share.backgroundColor = UIColor(   #colorLiteral(red: 0.03509925306, green: 0.08644359559, blue: 0.3300599456, alpha: 0.206281043) )
        share.layer.cornerRadius = 20
        share.layer.masksToBounds = true
       // share.backgroundColor = UIColor(named: "Color")
        share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)

       return share
       
   }()
    

  override func viewDidLoad() {
    super.viewDidLoad()
      view.backgroundColor = .white

      view.addSubview(sharePlace)
      
       view.addSubview(tableView2)
    //  view.backgroundColor = UIColor(named: "Color")

      
      
    NSLayoutConstraint.activate([
        tableView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        tableView2.heightAnchor.constraint(equalToConstant: 400),
        tableView2.widthAnchor.constraint(equalToConstant: 10),
        tableView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        tableView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150),
      // x: right and left
      // y: up and down
      sharePlace.widthAnchor.constraint(equalToConstant: 70),
      sharePlace.heightAnchor.constraint(equalToConstant: 50),
      sharePlace.topAnchor.constraint(equalTo: tableView2.bottomAnchor),
      sharePlace.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 150),
      sharePlace.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
    

    ])
      

  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  PlacesC?.placeA.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellR = tableView.dequeueReusableCell(withIdentifier: "ResturantCell", for: indexPath) as! ResturantDetailsCell
    let b = PlacesC!.placeA[indexPath.item]
      cellR.PlaceNameR.text = b.PlaceName
      cellR.PlaceImageR1.image = UIImage(named: b.PlaceImage1)
      cellR.PlaceImageR2.image = UIImage(named:  b.PlaceImage2)
      cellR.placeDetailR.text = b.placeDetail
      cellR.PlaceImageR3.image = UIImage(named: b.PlaceImage3)
      cellR.PlaceImageR4.image = UIImage(named: b.PlaceImage0)


    return cellR
  }
  var selectedIndex = -1
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     if indexPath.row == selectedIndex {
      return 354
     }else {
      return 500
     }
    }

    //share
   @objc func sharePressed (_ sender: Any) {
       let sharePlace = UIActivityViewController(activityItems: [self.PlacesC?.name ?? ""], applicationActivities: nil)
       sharePlace.popoverPresentationController?.sourceView = self.view
     self.present(sharePlace, animated: true, completion: nil)
   }
    }

class ResturantDetailsCell: UITableViewCell {
    
 static let identifier = "ResturantCell"
        
   let PlaceImageR1: UIImageView = {
    let PlaceImageR1 = UIImageView()
       PlaceImageR1.layer.borderWidth = 1
       PlaceImageR1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImageR1.layer.cornerRadius = 20
       PlaceImageR1.contentMode = .scaleAspectFill
       PlaceImageR1.clipsToBounds = true
       PlaceImageR1.backgroundColor = .systemTeal
    return PlaceImageR1
  }()
    

 
    var PlaceImageR2: UIImageView = {
        var PlaceImageR2 = UIImageView()
        PlaceImageR2.layer.borderWidth = 1
        PlaceImageR2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageR2.layer.cornerRadius = 20
        PlaceImageR2.contentMode = .scaleAspectFill
        PlaceImageR2.clipsToBounds = true
        PlaceImageR2.backgroundColor = .systemTeal
     return PlaceImageR2
   }()
    
   
    var PlaceImageR4: UIImageView = {
        var PlaceImageR4 = UIImageView()
        PlaceImageR4.layer.borderWidth = 1
        PlaceImageR4.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageR4.layer.cornerRadius = 20
        PlaceImageR4.contentMode = .scaleAspectFill
        PlaceImageR4.clipsToBounds = true
        PlaceImageR4.backgroundColor = .systemTeal
     return PlaceImageR4
   }()
    
    var PlaceImageR3: UIImageView = {
        var PlaceImageR3 = UIImageView()
        PlaceImageR3.layer.borderWidth = 1
        PlaceImageR3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageR3.layer.cornerRadius = 20
        PlaceImageR3.contentMode = .scaleAspectFill
        PlaceImageR3.clipsToBounds = true
        PlaceImageR3.backgroundColor = .systemTeal
     return PlaceImageR3
   }()
    
    var PlaceNameR: UILabel = {
    let PlaceNameR = UILabel()
        PlaceNameR.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        PlaceNameR.textAlignment = .center
        PlaceNameR.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        PlaceNameR.layer.cornerRadius = 20
        PlaceNameR.layer.masksToBounds = true
    return PlaceNameR
  }()
    
     let placeDetailR: UILabel = {
     let placeDetailR = UILabel()
         placeDetailR.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
         placeDetailR.textAlignment = .center
         placeDetailR.textColor = .darkGray
         placeDetailR.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha:                                                                      0.3)
         placeDetailR.layer.cornerRadius = 20
         placeDetailR.translatesAutoresizingMaskIntoConstraints = false
         placeDetailR.layer.masksToBounds = true
  return placeDetailR
   }()
       

 
  
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(PlaceImageR1)
    contentView.addSubview(PlaceImageR2)
    contentView.addSubview(PlaceNameR)
    contentView.addSubview(PlaceImageR4)

    contentView.addSubview(PlaceImageR3)
    contentView.addSubview(placeDetailR)


   
    contentView.clipsToBounds = true
    contentView.backgroundColor = .white
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder: has not implement>>>")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
      
      
     
    // x: right and left
    // y: up and down
      
      PlaceImageR1.frame = CGRect(x: 10,
                y: 10 ,
                width: 190,
                height: 200)
      PlaceImageR2.frame = CGRect(x: 205,
                  y: 10 ,
                  width: 190,
                  height: 200)
      
      PlaceImageR3.frame = CGRect(x: 10,
                  y: 220 ,
                  width: 190,
                  height: 200)
      
      PlaceNameR.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)
      
      
      PlaceImageR4.frame = CGRect(x: 205,
                                  y: 220 ,
                                width: 190,
                                height: 200)



      placeDetailR.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }
    
}

