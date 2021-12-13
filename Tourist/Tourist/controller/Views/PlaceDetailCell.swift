//
//  PlaceDetailVCl.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 22/04/1443 AH.
//


import UIKit

class Place1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  var Places: abhPlace?
    
    
  lazy var tableView1: UITableView = {
    let t = UITableView()
    t.translatesAutoresizingMaskIntoConstraints = false
    t.delegate = self
    t.dataSource = self
    t.register(PlaceCell1.self, forCellReuseIdentifier: PlaceCell1.identifier)
    return t
   }()
    
    
    let sharePlace: UIButton = {
       let share = UIButton()
      
        share.translatesAutoresizingMaskIntoConstraints = false
        share.setTitleColor(.black, for: .normal)
        share.setTitle("Send To Friend ⬆️", for: .normal)
        share.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 0.1)
        let image = UIImage(named: "fav")?.withRenderingMode(.alwaysTemplate)
        share.setImage(image, for: .normal)
        share.layer.cornerRadius = 20
        share.layer.masksToBounds = true
        share.backgroundColor = UIColor(named: "Color")
        share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)

       return share
       
   }()
    

  override func viewDidLoad() {
    super.viewDidLoad()
//      setGradientBackground()

      view.addSubview(sharePlace)
      
       view.addSubview(tableView1)
      view.backgroundColor = .white

      
      
    NSLayoutConstraint.activate([
        tableView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        tableView1.heightAnchor.constraint(equalToConstant: 400),
        tableView1.widthAnchor.constraint(equalToConstant: 10),
        tableView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        tableView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150),
      // x: right and left
      // y: up and down
      sharePlace.widthAnchor.constraint(equalToConstant: 100),
      sharePlace.heightAnchor.constraint(equalToConstant: 50),
      sharePlace.topAnchor.constraint(equalTo: tableView1.bottomAnchor),
      sharePlace.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 100),
      sharePlace.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
    

    ])
      

  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  Places?.placeA.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell1
    let b = Places!.placeA[indexPath.item]
    cell.nameLabel11.text = b.PlaceName
    cell.placeDeatil.text = b.placeDetail
      
      cell.PlaceImage00.image = UIImage(named: b.PlaceImage0)
      cell.PlaceImage11.image = UIImage(named: b.PlaceImage1)
      cell.PlaceImage12.image = UIImage(named: b.PlaceImage2)
      cell.PlaceImage13.image = UIImage(named: b.PlaceImage3)
      

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
       let shareBook = UIActivityViewController(activityItems: [self.Places?.name ?? ""], applicationActivities: nil)
       shareBook.popoverPresentationController?.sourceView = self.view
     self.present(shareBook, animated: true, completion: nil)
   }
    }

class PlaceCell1: UITableViewCell {
    
 static let identifier = "placeCell"
  let pdfTitle = Date()
    
  //@objc var webView: WKWebView?
    
   let PlaceImage00: UIImageView = {
    let PlaceImage0 = UIImageView()
       PlaceImage0.layer.borderWidth = 1
       PlaceImage0.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImage0.layer.cornerRadius = 20
       PlaceImage0.contentMode = .scaleAspectFill
       PlaceImage0.clipsToBounds = true
       PlaceImage0.backgroundColor = .systemTeal
    return PlaceImage0
  }()
    

 
    let PlaceImage11: UIImageView = {
     let PlaceImage1 = UIImageView()
        PlaceImage1.layer.borderWidth = 1
        PlaceImage1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImage1.layer.cornerRadius = 20
        PlaceImage1.contentMode = .scaleAspectFill
        PlaceImage1.clipsToBounds = true
        PlaceImage1.backgroundColor = .systemTeal
     return PlaceImage1
   }()
    
    
    let PlaceImage12: UIImageView = {
     let PlaceImage2 = UIImageView()
        PlaceImage2.layer.borderWidth = 1
        PlaceImage2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImage2.layer.cornerRadius = 20
        PlaceImage2.contentMode = .scaleAspectFill
        PlaceImage2.clipsToBounds = true
        PlaceImage2.backgroundColor = .systemTeal
     return PlaceImage2
   }()
    
    
    let PlaceImage13: UIImageView = {
     let PlaceImage3 = UIImageView()
        PlaceImage3.layer.borderWidth = 1
        PlaceImage3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImage3.layer.cornerRadius = 20
        PlaceImage3.contentMode = .scaleAspectFill
        PlaceImage3.clipsToBounds = true
        PlaceImage3.backgroundColor = .systemTeal
     return PlaceImage3
   }()
    
    
   let nameLabel11: UILabel = {
    let nameplace = UILabel()
    nameplace.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
    nameplace.textAlignment = .center
    nameplace.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
    nameplace.layer.cornerRadius = 20
    nameplace.layer.masksToBounds = true
    return nameplace
  }()
    
    let placeDeatil: UILabel = {
     let placeDeatil = UILabel()
        placeDeatil.font = UIFont(name: "AvenirNextCondensed-Medium", size: 10.0)
        placeDeatil.textAlignment = .center
        placeDeatil.textColor = .red
        placeDeatil.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        placeDeatil.layer.cornerRadius = 20
        placeDeatil.translatesAutoresizingMaskIntoConstraints = false
        placeDeatil.layer.masksToBounds = true
     return placeDeatil
   }()
       

 
  
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    //super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(PlaceImage00)
    contentView.addSubview(PlaceImage11)
    contentView.addSubview(PlaceImage12)
    contentView.addSubview(PlaceImage13)
    contentView.addSubview(nameLabel11)
    contentView.addSubview(placeDeatil)


   
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
      
      PlaceImage00.frame = CGRect(x: 10,
                y: 10 ,
                width: 190,
                height: 200)
      PlaceImage11.frame = CGRect(x: 205,
                  y: 10 ,
                  width: 190,
                  height: 200)
      
      
      
      nameLabel11.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)
      
      
      PlaceImage12.frame = CGRect(x: 205,
                                  y: 220 ,
                                width: 190,
                                height: 200)

      PlaceImage13.frame = CGRect(x: 10,
                                  y: 220 ,
                                width: 190,
                                height: 200)

      placeDeatil.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }
    
}
