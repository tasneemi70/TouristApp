//
//  NatuDetailCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 16/05/1443 AH.
//



import UIKit

class NaturalDetailsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var Places: abhPlace?
    var PlacesC: abhPlace?


  lazy var tableView2: UITableView = {
    let table = UITableView()
      table.translatesAutoresizingMaskIntoConstraints = false
      table.delegate = self
      table.dataSource = self
      table.register(NaturalDetailsCell1.self, forCellReuseIdentifier: NaturalCell.identfir)
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
        LocationBtn.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)

       return LocationBtn

   }()

  override func viewDidLoad() {
    super.viewDidLoad()
      view.backgroundColor = .white

      view.addSubview(sharePlace)
      view.addSubview(LocationBtn)
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
        
        LocationBtn.widthAnchor.constraint(equalToConstant: 70),
        LocationBtn.heightAnchor.constraint(equalToConstant: 50),
        LocationBtn.topAnchor.constraint(equalTo: tableView2.bottomAnchor),
        LocationBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 250),
        LocationBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
          

    ])


  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  PlacesC?.placeA.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellN = tableView.dequeueReusableCell(withIdentifier: "CellN", for: indexPath) as! NaturalDetailsCell1
    let b = PlacesC!.placeA[indexPath.item]
      cellN.PlaceNameN.text = b.PlaceName
      cellN.PlaceImageN1.image = UIImage(named: b.PlaceImage1)
      cellN.PlaceImageN2.image = UIImage(named:  b.PlaceImage2)
      cellN.placeDetailN.text = b.placeDetail
      cellN.PlaceImageN3.image = UIImage(named: b.PlaceImage3)
      cellN.PlaceImageN4.image = UIImage(named: b.PlaceImage0)


    return cellN
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

class NaturalDetailsCell1: UITableViewCell {

 static let identifier = "CellN"
  let pdfTitle = Date()

  //@objc var webView: WKWebView?

   let PlaceImageN1: UIImageView = {
    let PlaceImageN1 = UIImageView()
       PlaceImageN1.layer.borderWidth = 1
       PlaceImageN1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImageN1.layer.cornerRadius = 20
       PlaceImageN1.contentMode = .scaleAspectFill
       PlaceImageN1.clipsToBounds = true
       PlaceImageN1.backgroundColor = .systemTeal
    return PlaceImageN1
  }()



    var PlaceImageN2: UIImageView = {
        var PlaceImageN2 = UIImageView()
        PlaceImageN2.layer.borderWidth = 1
        PlaceImageN2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageN2.layer.cornerRadius = 20
        PlaceImageN2.contentMode = .scaleAspectFill
        PlaceImageN2.clipsToBounds = true
        PlaceImageN2.backgroundColor = .systemTeal
     return PlaceImageN2
   }()


    var PlaceImageN4: UIImageView = {
        var PlaceImageN4 = UIImageView()
        PlaceImageN4.layer.borderWidth = 1
        PlaceImageN4.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageN4.layer.cornerRadius = 20
        PlaceImageN4.contentMode = .scaleAspectFill
        PlaceImageN4.clipsToBounds = true
        PlaceImageN4.backgroundColor = .systemTeal
     return PlaceImageN4
   }()

    var PlaceImageN3: UIImageView = {
        var PlaceImageN3 = UIImageView()
        PlaceImageN3.layer.borderWidth = 1
        PlaceImageN3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageN3.layer.cornerRadius = 20
        PlaceImageN3.contentMode = .scaleAspectFill
        PlaceImageN3.clipsToBounds = true
        PlaceImageN3.backgroundColor = .systemTeal
     return PlaceImageN3
   }()

    var PlaceNameN: UILabel = {
    let PlaceNameN = UILabel()
        PlaceNameN.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        PlaceNameN.textAlignment = .center
        PlaceNameN.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        PlaceNameN.layer.cornerRadius = 20
        PlaceNameN.layer.masksToBounds = true
    return PlaceNameN
  }()

    
    let placeDetailN: UILabel = {
    let placeDetailN = UILabel()
        placeDetailN.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
        placeDetailN.textAlignment = .center
        placeDetailN.textColor = .darkGray
        placeDetailN.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha:                                                                      0.3)
        placeDetailN.layer.cornerRadius = 20
        placeDetailN.translatesAutoresizingMaskIntoConstraints = false
        placeDetailN.layer.masksToBounds = true
 return placeDetailN
        
  }()



override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     contentView.addSubview(PlaceImageN1)
     contentView.addSubview(PlaceImageN2)
      contentView.addSubview(PlaceNameN)
     contentView.addSubview(PlaceImageN4)

    contentView.addSubview(PlaceImageN3)
    contentView.addSubview(placeDetailN)



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

      PlaceImageN1.frame = CGRect(x: 10,
                y: 10 ,
                width: 190,
                height: 200)
      PlaceImageN2.frame = CGRect(x: 205,
                  y: 10 ,
                  width: 190,
                  height: 200)

      PlaceImageN3.frame = CGRect(x: 10,
                  y: 220 ,
                  width: 190,
                  height: 200)

      PlaceNameN.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)


      PlaceImageN4.frame = CGRect(x: 205,
                                  y: 220 ,
                                width: 190,
                                height: 200)



      placeDetailN.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }

}

