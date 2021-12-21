//
//  HtlDetailCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 16/05/1443 AH.



import UIKit

class HotelDetailsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var Places: abhPlace?
    var PlacesC: abhPlace?


  lazy var tableView2: UITableView = {
    let table = UITableView()
      table.translatesAutoresizingMaskIntoConstraints = false
      table.delegate = self
      table.dataSource = self
      table.register(HotelsDetailsCell1.self, forCellReuseIdentifier: HotelCell.identfir)
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
    let cellH = tableView.dequeueReusableCell(withIdentifier: "HotelsCell", for: indexPath) as! HotelsDetailsCell1
    let b = PlacesC!.placeA[indexPath.item]
      cellH.PlaceNameH.text = b.PlaceName
      cellH.PlaceImageH1.image = UIImage(named: b.PlaceImage1)
      cellH.PlaceImageH2.image = UIImage(named:  b.PlaceImage2)
      cellH.placeDetailH.text = b.placeDetail
      cellH.PlaceImageH3.image = UIImage(named: b.PlaceImage3)
      cellH.PlaceImageH4.image = UIImage(named: b.PlaceImage0)


    return cellH
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

class HotelsDetailsCell1: UITableViewCell {

 static let identifier = "HotelsCell"
  let pdfTitle = Date()

  //@objc var webView: WKWebView?

   let PlaceImageH1: UIImageView = {
    let PlaceImageH1 = UIImageView()
       PlaceImageH1.layer.borderWidth = 1
       PlaceImageH1.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
       PlaceImageH1.layer.cornerRadius = 20
       PlaceImageH1.contentMode = .scaleAspectFill
       PlaceImageH1.clipsToBounds = true
       PlaceImageH1.backgroundColor = .systemTeal
    return PlaceImageH1
  }()



    var PlaceImageH2: UIImageView = {
        var PlaceImageH2 = UIImageView()
        PlaceImageH2.layer.borderWidth = 1
        PlaceImageH2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageH2.layer.cornerRadius = 20
        PlaceImageH2.contentMode = .scaleAspectFill
        PlaceImageH2.clipsToBounds = true
        PlaceImageH2.backgroundColor = .systemTeal
     return PlaceImageH2
   }()


    var PlaceImageH4: UIImageView = {
        var PlaceImageH4 = UIImageView()
        PlaceImageH4.layer.borderWidth = 1
        PlaceImageH4.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageH4.layer.cornerRadius = 20
        PlaceImageH4.contentMode = .scaleAspectFill
        PlaceImageH4.clipsToBounds = true
        PlaceImageH4.backgroundColor = .systemTeal
     return PlaceImageH4
   }()

    var PlaceImageH3: UIImageView = {
        var PlaceImageH3 = UIImageView()
        PlaceImageH3.layer.borderWidth = 1
        PlaceImageH3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageH3.layer.cornerRadius = 20
        PlaceImageH3.contentMode = .scaleAspectFill
        PlaceImageH3.clipsToBounds = true
        PlaceImageH3.backgroundColor = .systemTeal
     return PlaceImageH3
   }()

    var PlaceNameH: UILabel = {
    let PlaceNameH = UILabel()
        PlaceNameH.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        PlaceNameH.textAlignment = .center
        PlaceNameH.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        PlaceNameH.layer.cornerRadius = 20
        PlaceNameH.layer.masksToBounds = true
    return PlaceNameH
  }()

     let placeDetailH: UILabel = {
     let placeDetailH = UILabel()
         placeDetailH.font = UIFont(name: "AvenirNextCondensed-Medium", size:    13.0)
         placeDetailH.textAlignment = .center
         placeDetailH.textColor = .darkGray
         placeDetailH.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha:                                                                      0.3)
         placeDetailH.layer.cornerRadius = 20
         placeDetailH.translatesAutoresizingMaskIntoConstraints = false
         placeDetailH.layer.masksToBounds = true
  return placeDetailH
   }()




override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     contentView.addSubview(PlaceImageH1)
     contentView.addSubview(PlaceImageH2)
      contentView.addSubview(PlaceNameH)
     contentView.addSubview(PlaceImageH4)

    contentView.addSubview(PlaceImageH3)
    contentView.addSubview(placeDetailH)



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

      PlaceImageH1.frame = CGRect(x: 10,
                y: 10 ,
                width: 190,
                height: 200)
      PlaceImageH2.frame = CGRect(x: 205,
                  y: 10 ,
                  width: 190,
                  height: 200)

      PlaceImageH3.frame = CGRect(x: 10,
                  y: 220 ,
                  width: 190,
                  height: 200)

      PlaceNameH.frame = CGRect(x: 10,
                    y: 430 ,
                  width: 150,
                  height: 50)


      PlaceImageH4.frame = CGRect(x: 205,
                                  y: 220 ,
                                width: 190,
                                height: 200)



      placeDetailH.frame =  CGRect(x: 230,
                             y: 430 ,
                           width: 150,
                           height: 50)
  }

}

