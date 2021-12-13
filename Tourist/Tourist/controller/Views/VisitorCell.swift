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
        namebook.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
        namebook.layer.cornerRadius = 0
        namebook.layer.masksToBounds = true

        return namebook

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
        
        let bookname = nameLabel.text ?? ""
        _ = bookImage.image ?? UIImage(systemName: "house")
        FavoriteServiceVisitor.shared.addToFavorite(favPlace: FavArabic(image: book.image, name: bookname))
    }

    func setCell(book: abhPlace) {
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
        favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
        
    }
}

