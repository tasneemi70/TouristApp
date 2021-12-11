//
//  ArabicCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani  on 19/04/1443 AH.
//
//

import UIKit

var favoritBook: [abhPlace] = []


class VisitorCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "cell"
    var book: abhPlace!
    var isActive: Bool = false

    let people: [abhPlace] = []

    private let bookImage: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image = UIImage(named: "a1")
       
        bookImage.layer.borderWidth = 1
        bookImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        bookImage.layer.cornerRadius = 20
        bookImage.backgroundColor = .systemTeal

        return bookImage
    }()

    private let nameLabel: UILabel = {
        let namebook = UILabel()
        namebook.text = ""
        namebook.textColor = .darkGray
        namebook.textAlignment = .right
        namebook.backgroundColor = UIColor(displayP3Red: 230/255, green:  220/255, blue: 200/255, alpha: 1)
        namebook.layer.cornerRadius = 0
        namebook.layer.masksToBounds = true

        return namebook

    }()


    private let favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "star.fill"), for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(addfavoriteBook), for: .touchUpInside)
        return button
    }()

    @objc func addfavoriteBook() {
        
        if isActive {
            isActive = false
            favButton.setImage(UIImage(named: "star.fill"), for: .normal)
        } else {

               isActive = true
                favButton.setImage(UIImage(named: "star.fill"), for: .normal)

        }
        
        let bookname = nameLabel.text ?? ""
        _ = bookImage.image ?? UIImage(systemName: "house")
        FavoriteServiceArabic.shared.addToFavorite(favBook: FavArabic(image: book.image, name: bookname))
    }
    //(image:  Image.image ,

    func setCell(book: abhPlace) {
//        bookImage.image = book.image
        bookImage.image = UIImage(named: book.image)
        nameLabel.text = book.name
        self.book = book

    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bookImage)
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

        bookImage.frame = CGRect(x: 1, y: 5, width: 180, height: 190)
        nameLabel.frame = CGRect(x: -60 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 160 , y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)

        
    }
}

