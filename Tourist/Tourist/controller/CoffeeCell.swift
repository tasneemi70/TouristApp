//
//  CoffeeCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//
import UIKit

var favoritCoffee: [coffee] = []


class CoffeeCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "cell1"
    var placeC: coffee!
    var isActive: Bool = false

    let peopleC: [coffee] = []

    private let placeImageC: UIImageView = {
        let placeImageC = UIImageView()
        placeImageC.image = UIImage(named: "a1")
       
        placeImageC.layer.borderWidth = 1
        placeImageC.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        placeImageC.layer.cornerRadius = 20
        placeImageC.backgroundColor = .systemTeal

        return placeImageC
    }()

    private let nameCoffee: UILabel = {
        let nameCoffee = UILabel()
        nameCoffee.text = ""
        nameCoffee.textColor = .darkGray
        nameCoffee.textAlignment = .right
        nameCoffee.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
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
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavVisitor(image: placeC.image, name: CoffeeName))
    }

    func setCell(placeC: coffee) {
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

