//
//  CoffeeCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//
import UIKit

var favoritCoffee: [abhPlace] = []


class CoffeeCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "Cell"
    var placeC: abhPlace!
    var isActive: Bool = false

    let peopleC: [abhPlace] = []

    private let placeImageC: UIImageView = {
        let placeImageC = UIImageView()
        placeImageC.image = UIImage(named: "a1")
        placeImageC.layer.cornerRadius = 20
        placeImageC.backgroundColor = .systemTeal

        return placeImageC
    }()

    private let nameCoffee: UILabel = {
        let nameCoffee = UILabel()
        nameCoffee.text = ""
        nameCoffee.textColor = .darkGray
        nameCoffee.textAlignment = .right
        nameCoffee.backgroundColor = UIColor(red: 0.6468747258, green: 0.6789115071, blue: 0.7230498195, alpha: 1)
        nameCoffee.layer.cornerRadius = 0
        nameCoffee.layer.masksToBounds = true

        return nameCoffee

    }()


    private let favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "like"), for: .normal)
        button.addTarget(self, action: #selector(addfavoritePlace), for: .touchUpInside)
        return button
    }()

    @objc func addfavoritePlace() {
        
        if isActive {
            isActive = false
            favButton.setImage(UIImage(named: "like"), for: .normal)
        } else {

               isActive = true
                favButton.setImage(UIImage(named: "like2"), for: .normal)

        }
        
        let CoffeeName = nameCoffee.text ?? ""
        _ = placeImageC.image ?? UIImage(systemName: "house")
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavVisitor(image: placeC.image, name: CoffeeName, id: placeC.id))
    }

    func setCell(placeC: abhPlace) {
        placeImageC.image = UIImage(named: placeC.image)
        nameCoffee.text = placeC.name
        self.placeC = placeC

    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(placeImageC)
        contentView.addSubview(nameCoffee)
        contentView.addSubview(favButton)
        contentView.clipsToBounds = true



    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down

        placeImageC.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameCoffee.frame = CGRect(x: -60 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
        
    }
}


class CoffeeCell1: UICollectionViewCell  {

 static let identifier = "CoffeeCell1"

    
        let sharePlace: UIButton = {
           let share = UIButton()
    
            share.translatesAutoresizingMaskIntoConstraints = false
            share.setTitleColor(.darkGray, for: .normal)
            share.setImage(UIImage(named: "send"), for: .normal)
            share.layer.cornerRadius = 20
            share.layer.masksToBounds = true
          // share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
    
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
    
      let PlaceImageC1: UIImageView = {
         let PlaceImageC1 = UIImageView()
//       PlaceImageC1.layer.borderWidth = 1
       PlaceImageC1.translatesAutoresizingMaskIntoConstraints = false
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
        PlaceImageC2.translatesAutoresizingMaskIntoConstraints = false
        PlaceImageC2.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC2.layer.cornerRadius = 20
        PlaceImageC2.contentMode = .scaleAspectFill
        PlaceImageC2.clipsToBounds = true
        PlaceImageC2.backgroundColor = .systemTeal
     return PlaceImageC2
   }()


    var PlaceImageC4: UIImageView = {
        var PlaceImageC4 = UIImageView()
        PlaceImageC4.translatesAutoresizingMaskIntoConstraints = false
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
        PlaceImageC3.translatesAutoresizingMaskIntoConstraints = false
        PlaceImageC3.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        PlaceImageC3.layer.cornerRadius = 20
        PlaceImageC3.contentMode = .scaleAspectFill
        PlaceImageC3.clipsToBounds = true
        PlaceImageC3.backgroundColor = .systemTeal
     return PlaceImageC3
   }()

    var PlaceNameC: UILabel = {
    let PlaceNameC = UILabel()
       PlaceNameC.translatesAutoresizingMaskIntoConstraints = false
       PlaceNameC.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
       PlaceNameC.textAlignment = .center
       PlaceNameC.backgroundColor =   UIColor(red: 0.6468747258, green: 0.6789115071, blue: 0.7230498195, alpha: 0.10)
       PlaceNameC.layer.cornerRadius = 20
       PlaceNameC.layer.masksToBounds = true
    return PlaceNameC
  }()

    let placeDetailC: UILabel = {
     let placeDetailC = UILabel()
        placeDetailC.translatesAutoresizingMaskIntoConstraints = false
        placeDetailC.font = UIFont(name: "AvenirNextCondensed-Medium", size:    25.0)
        placeDetailC.textAlignment = .center
        placeDetailC.textColor = .darkGray
        placeDetailC.translatesAutoresizingMaskIntoConstraints = false
        placeDetailC.layer.masksToBounds = true
     return placeDetailC
   }()


    override init(frame: CGRect) {
        super.init(frame: frame)
    contentView.addSubview(PlaceImageC1)
    contentView.addSubview(PlaceImageC2)
    contentView.addSubview(PlaceNameC)
    contentView.addSubview(PlaceImageC4)
    contentView.addSubview(PlaceImageC3)
    contentView.addSubview(placeDetailC)
    contentView.addSubview(sharePlace)
    contentView.addSubview(LocationBtn)
    contentView.clipsToBounds = true
    contentView.backgroundColor = UIColor (  #colorLiteral(red: 0.01546635386, green: 0.1756357253, blue: 0.2539866269, alpha: 1))
    }


    //share

   
  required init?(coder: NSCoder) {
    fatalError("init(coder: has not implement>>>")
  }

    
  override func layoutSubviews() {
    super.layoutSubviews()

   
    // x: right and left
    // y: up and down

      
      PlaceImageC1.frame = CGRect(x: 1,
                y: 5 ,
                width: 189,
                height: 190)
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
      
      
      sharePlace.frame =  CGRect(x: 150,
                             y: 500 ,
                           width: 60,
                           height: 40)
      
      LocationBtn.frame =  CGRect(x: 230,
                             y: 500 ,
                           width: 60,
                           height: 40)
      
      
  }
//   @objc func sharePressed (_ sender: Any) {
//       let sharePlace = UIActivityViewController(activityItems: [self.PlacesC?.name ?? ""], applicationActivities: nil)
//       sharePlace.popoverPresentationController?.sourceView = self.view
//     self.present(sharePlace, animated: true, completion: nil)
//   }
    
        @objc func locationPressed (_ sender: Any) {
            if let url = URL(string: "https://goo.gl/maps/aE9ATgwS3sidTEVM9") {
                       UIApplication.shared.open(url)
    
    
                      }
        }
}
