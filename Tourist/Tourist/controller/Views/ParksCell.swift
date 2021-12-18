//

//  Tourist
//
//  Created by Tsnim Alqahtani  on 19/04/1443 AH.
//
//

import UIKit

var favoritPlace: [abhPlace] = []


class VisitorCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "cell"
    var place: abhPlace!
    var isActive: Bool = false

    let people: [abhPlace] = []

    private let placeImage: UIImageView = {
        let placeImage = UIImageView()
        placeImage.image = UIImage(named: "a1")
       
        placeImage.layer.borderWidth = 1
        placeImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        placeImage.layer.cornerRadius = 20
        placeImage.backgroundColor = .systemTeal

        return placeImage
    }()

    private let nameLabel: UILabel = {
        let nameplace = UILabel()
        nameplace.text = ""
        nameplace.textColor = .darkGray
        nameplace.textAlignment = .right
        nameplace.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        nameplace.layer.cornerRadius = 0
        nameplace.layer.masksToBounds = true

        return nameplace

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
        
        let placename = nameLabel.text ?? ""
        _ = placeImage.image ?? UIImage(systemName: "house")
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavVisitor(image: place.image, name: placename))
    }

    func setCell(place: abhPlace) {
        placeImage.image = UIImage(named: place.image)
        nameLabel.text = place.name
        self.place = place

    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(placeImage)
        contentView.addSubview(nameLabel)
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

        placeImage.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameLabel.frame = CGRect(x: -60 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
        
    }
}

