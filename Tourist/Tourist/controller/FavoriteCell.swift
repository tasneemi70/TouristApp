//
//  FavoriteCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 05/05/1443 AH.
//

import UIKit


class FavouriteCell: UITableViewCell {

    var fPlace = [abhPlace]()

    static let identfir = "Fav"


     let placeImage2: UIImageView = {
        let placeImage = UIImageView()

           placeImage.layer.borderWidth = 1
           placeImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
           placeImage.clipsToBounds = false
           placeImage.layer.shadowColor = UIColor.black.cgColor
           //placeImage.layer.shadowOpacity = 9.0
           //placeImage.layer.shadowRadius = 10
           placeImage.layer.masksToBounds = false


              return placeImage
    }()


     let nameLabel2: UILabel = {
        let nameplace = UILabel()

         nameplace.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20.0)
         nameplace.textColor = .black
         nameplace.textAlignment = .center
         nameplace.layer.cornerRadius = 150
         nameplace.layer.masksToBounds = true
         nameplace.backgroundColor = UIColor(named: "Color")

        return nameplace

    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(placeImage2)
        contentView.addSubview(nameLabel2)
        contentView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down

        
    
        
        placeImage2.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameLabel2.frame = CGRect(x: 80 , y: contentView.frame.size.height - 40, width: contentView.frame.size.width - 5, height: 40)
      }
}

