//
//  CoffeeDetails.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//


import UIKit

class CoffeeDetailsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var Places: abhPlace?
    var PlacesC: coffee?

    
  lazy var tableView2: UITableView = {
    let table = UITableView()
      table.translatesAutoresizingMaskIntoConstraints = false
      table.delegate = self
      table.dataSource = self
      table.register(CoffeeCell1.self, forCellReuseIdentifier: CoffeeCell1.identifier)
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
    return  PlacesC?.placeB.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell1", for: indexPath) as! CoffeeCell1
    let b = PlacesC!.placeB[indexPath.item]
    cell.PlaceNameC.text = b.PlaceNameC
    cell.placeDetailC.text = b.placeDetailC
      
      cell.PlaceImageC1.image = UIImage(named: b.PlaceImageC1)
      cell.PlaceImageC2.image = UIImage(named: b.PlaceImageC2)
//      cell.CoffeeImage0.image = UIImage(named: b.CoffeeImage10)
//      cell.PlaceImage13.image = UIImage(named: b.PlaceImage3)
      

    return cell
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

class CoffeeCell1: UITableViewCell {
    
 static let identifier = "CoffeeCell1"
  let pdfTitle = Date()
    
  //@objc var webView: WKWebView?
    
   let PlaceImageC1: UIImageView = {
    let PlaceImageC1 = UIImageView()
       PlaceImageC1.layer.borderWidth = 1
       PlaceImageC1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImageC1.layer.cornerRadius = 20
       PlaceImageC1.contentMode = .scaleAspectFill
       PlaceImageC1.clipsToBounds = true
       PlaceImageC1.backgroundColor = .systemTeal
    return PlaceImageC1
  }()
    

 
    var PlaceImageC2: UIImageView = {
        var PlaceImageC2 = UIImageView()
        PlaceImageC2.layer.borderWidth = 1
        PlaceImageC2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC2.layer.cornerRadius = 20
        PlaceImageC2.contentMode = .scaleAspectFill
        PlaceImageC2.clipsToBounds = true
        PlaceImageC2.backgroundColor = .systemTeal
     return PlaceImageC2
   }()
    
   
    
    var PlaceNameC: UILabel = {
    let PlaceNameC = UILabel()
       PlaceNameC.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
       PlaceNameC.textAlignment = .center
       PlaceNameC.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
       PlaceNameC.layer.cornerRadius = 20
       PlaceNameC.layer.masksToBounds = true
    return PlaceNameC
  }()
    
    let placeDetailC: UILabel = {
     let placeDetailC = UILabel()
        placeDetailC.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
        placeDetailC.textAlignment = .center
        placeDetailC.textColor = .darkGray
        placeDetailC.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        placeDetailC.layer.cornerRadius = 20
        placeDetailC.translatesAutoresizingMaskIntoConstraints = false
        placeDetailC.layer.masksToBounds = true
     return placeDetailC
   }()
       

 
  
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(PlaceImageC1)
    contentView.addSubview(PlaceImageC2)
    contentView.addSubview(PlaceNameC)
    contentView.addSubview(placeDetailC)


   
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
      
      PlaceImageC1.frame = CGRect(x: 10,
                y: 10 ,
                width: 190,
                height: 200)
      PlaceImageC2.frame = CGRect(x: 205,
                  y: 10 ,
                  width: 190,
                  height: 200)
      
      
      
      PlaceNameC.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)
      
      
//      CoffeeImage2.frame = CGRect(x: 205,
//                                  y: 220 ,
//                                width: 190,
//                                height: 200)



      placeDetailC.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }
    
}

