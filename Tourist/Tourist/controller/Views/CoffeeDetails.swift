//
//  CoffeeDetails.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//


import UIKit

class CoffeeDetailsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var Places: abhPlace?
    var PlacesC: abhPlace?

    
  lazy var tableView2: UITableView = {
    let table = UITableView()
      table.translatesAutoresizingMaskIntoConstraints = false
      table.delegate = self
      table.dataSource = self
      table.backgroundColor = UIColor(named: "setGradientBackground")
      table.register(CoffeeCell1.self, forCellReuseIdentifier: CoffeeCell1.identifier)
    return table
   }()
    
    
    let sharePlace: UIButton = {
       let share = UIButton()
      
        share.translatesAutoresizingMaskIntoConstraints = false
        share.setTitleColor(.darkGray, for: .normal)
        share.setImage(UIImage(named: "send"), for: .normal)
        share.layer.cornerRadius = 20
        share.layer.masksToBounds = true
        share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)

       return share
       

   
    }()
    
                      
     let LocationBtn: UIButton = {
        let LocationBtn = UIButton()

         LocationBtn.translatesAutoresizingMaskIntoConstraints = false
         LocationBtn.setTitleColor(.darkGray, for: .normal)
         LocationBtn.setImage(UIImage(named: "Location"), for: .normal)
 //        LocationBtn.setTitle("       Location", for: .normal)
         LocationBtn.backgroundColor = UIColor(   #colorLiteral(red: 0.03509925306, green: 0.08644359559, blue: 0.3300599456, alpha: 0.206281043) )
         LocationBtn.layer.cornerRadius = 20
         LocationBtn.layer.masksToBounds = true
 //        LocationBtn.backgroundColor = .blue
         LocationBtn.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)

        return LocationBtn

     
    }()
    

  override func viewDidLoad() {
    super.viewDidLoad()
      let textView = UITextView(frame: CGRect(x: 220.0, y: 620, width: 150.0, height: 70))
      view.addSubview(textView)
      textView.contentInsetAdjustmentBehavior = .automatic
      textView.textAlignment = NSTextAlignment.center
      textView.textColor = UIColor.black
      textView.backgroundColor = UIColor.lightGray
      textView.isUserInteractionEnabled = true
      textView.layer.cornerRadius = 18
    
      
      
      
      
      
      view.backgroundColor = UIColor(named: "setGradientBackground")

      setGradientBackground()

      view.addSubview(sharePlace)
      view.addSubview(LocationBtn)

       view.addSubview(tableView2)
     

      
      
    NSLayoutConstraint.activate([
        
        tableView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        tableView2.heightAnchor.constraint(equalToConstant: 400),
        tableView2.widthAnchor.constraint(equalToConstant: 10),
        tableView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        tableView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200),
        
        
      // x: right and left
      // y: up and down

        
        sharePlace.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
        sharePlace.self.heightAnchor.constraint(equalToConstant: 50),
        sharePlace.self.widthAnchor.constraint(equalToConstant: 70),
        sharePlace.topAnchor.constraint(equalTo: tableView2.bottomAnchor, constant: 100),
        
        LocationBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
        LocationBtn.self.heightAnchor.constraint(equalToConstant: 50),
        LocationBtn.self.widthAnchor.constraint(equalToConstant: 70),
        LocationBtn.topAnchor.constraint(equalTo: tableView2.bottomAnchor, constant: 100),
       

        

    ])



  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  PlacesC?.placeA.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell1", for: indexPath) as! CoffeeCell1
    let b = PlacesC!.placeA[indexPath.item]
      cell.PlaceNameC.text = b.PlaceName
      cell.PlaceImageC1.image = UIImage(named: b.PlaceImage1)
      cell.PlaceImageC2.image = UIImage(named:  b.PlaceImage2)
      cell.placeDetailC.text = b.placeDetail
      cell.PlaceImageC3.image = UIImage(named: b.PlaceImage3)
      cell.PlaceImageC4.image = UIImage(named: b.PlaceImage0)


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
    
        @objc func locationPressed (_ sender: Any) {
            if let url = URL(string: "https://goo.gl/maps/aE9ATgwS3sidTEVM9") {
                       UIApplication.shared.open(url)
    
    
                      }
    }

class CoffeeCell1: UITableViewCell {
    
 static let identifier = "CoffeeCell1"
  let pdfTitle = Date()
    
    
   let PlaceImageC1: UIImageView = {
    let PlaceImageC1 = UIImageView()
//       PlaceImageC1.layer.borderWidth = 1
       PlaceImageC1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImageC1.layer.cornerRadius = 20
       PlaceImageC1.contentMode = .scaleAspectFill
       PlaceImageC1.clipsToBounds = true
       PlaceImageC1.backgroundColor = .systemTeal
    return PlaceImageC1
  }()
    

 
    var PlaceImageC2: UIImageView = {
        var PlaceImageC2 = UIImageView()
//        PlaceImageC2.layer.borderWidth = 1
        PlaceImageC2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC2.layer.cornerRadius = 20
        PlaceImageC2.contentMode = .scaleAspectFill
        PlaceImageC2.clipsToBounds = true
        PlaceImageC2.backgroundColor = .systemTeal
     return PlaceImageC2
   }()
    
   
    var PlaceImageC4: UIImageView = {
        var PlaceImageC4 = UIImageView()
//        PlaceImageC4.layer.borderWidth = 1
        PlaceImageC4.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC4.layer.cornerRadius = 20
        PlaceImageC4.contentMode = .scaleAspectFill
        PlaceImageC4.clipsToBounds = true
        PlaceImageC4.backgroundColor = .systemTeal
     return PlaceImageC4
   }()
    
    var PlaceImageC3: UIImageView = {
        var PlaceImageC3 = UIImageView()
//        PlaceImageC3.layer.borderWidth = 1
        PlaceImageC3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC3.layer.cornerRadius = 20
        PlaceImageC3.contentMode = .scaleAspectFill
        PlaceImageC3.clipsToBounds = true
        PlaceImageC3.backgroundColor = .systemTeal
     return PlaceImageC3
   }()
    
    var PlaceNameC: UILabel = {
    let PlaceNameC = UILabel()
       PlaceNameC.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
       PlaceNameC.textAlignment = .center
       PlaceNameC.backgroundColor =   UIColor(red: 0.6468747258, green: 0.6789115071, blue: 0.7230498195, alpha: 1)
       PlaceNameC.layer.cornerRadius = 20
       PlaceNameC.layer.masksToBounds = true
    return PlaceNameC
  }()
    
    let placeDetailC: UILabel = {
     let placeDetailC = UILabel()
        placeDetailC.font = UIFont(name: "AvenirNextCondensed-Medium", size:    25.0)
        placeDetailC.textAlignment = .center
        placeDetailC.textColor = .darkGray
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
    contentView.addSubview(PlaceImageC4)

    contentView.addSubview(PlaceImageC3)
    contentView.addSubview(placeDetailC)


   
    contentView.clipsToBounds = true
    contentView.backgroundColor = UIColor (  #colorLiteral(red: 0.01546635386, green: 0.1756357253, blue: 0.2539866269, alpha: 1))  }
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
      
      PlaceImageC3.frame = CGRect(x: 10,
                  y: 220 ,
                  width: 190,
                  height: 200)
      
      PlaceNameC.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)
      
      
      PlaceImageC4.frame = CGRect(x: 205,
                                  y: 220 ,
                                width: 190,
                                height: 200)



      placeDetailC.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }
    
}

}
