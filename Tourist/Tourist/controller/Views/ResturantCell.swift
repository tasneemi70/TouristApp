//

//  Tourist
//
//  Created by Tsnim Alqahtani  on 19/04/1443 AH.
//
//

import UIKit

var favoritResturant: [abhPlace] = []


class ResturantCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "CellR"
    var placeR: abhPlace!
    var isActive: Bool = false

    let peopleR: [abhPlace] = []

    private let placeImageR: UIImageView = {
        let placeImageR = UIImageView()
        placeImageR.image = UIImage(named: "a1")
       
//        placeImageR.layer.borderWidth = 1
      //  placeImageR.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        placeImageR.layer.cornerRadius = 20
        placeImageR.backgroundColor = .systemTeal

        return placeImageR
    }()

    private let nameRest: UILabel = {
        let nameRest = UILabel()
        nameRest.text = ""
        nameRest.textColor = .darkGray
        nameRest.textAlignment = .right
        nameRest.backgroundColor = UIColor(red: 0.6468747258, green: 0.6789115071, blue: 0.7230498195, alpha: 1)
        nameRest.layer.cornerRadius = 0
        nameRest.layer.masksToBounds = true

        return nameRest

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
        
        let RestName = nameRest.text ?? ""
        _ = placeImageR.image ?? UIImage(systemName: "house")
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavVisitor(image: placeR.image, name: RestName, id: placeR.id))
    }

    func setCell(placeR: abhPlace) {
        placeImageR.image = UIImage(named: placeR.image)
        nameRest.text = placeR.name
        self.placeR = placeR

    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(placeImageR)
        contentView.addSubview(nameRest)
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

        placeImageR.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameRest.frame = CGRect(x: -60 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
        
    }
}

