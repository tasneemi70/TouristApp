//
//  ArabicCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani  on 19/04/1443 AH.
//
//

import UIKit


class VisitorCell: UICollectionViewCell, UISearchBarDelegate {

    static let identfir = "cell"
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
       // namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
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
        button.imageView?.image = UIImage(named: "heart1")
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "bookMark"), for: .normal)
        button.addTarget(self, action: "favFunc", for: .touchUpInside)

        return button
    }()

   

    func setCell(book: abhPlace) {
        bookImage.image = book.image
        nameLabel.text = book.name
   //     title.text = book.name
        
    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bookImage)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(favButton)
        //contentView.addSubview(title)
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
        favButton.frame = CGRect(x: 2, y: contentView.frame.size.height - 55, width: 50, height: 40)
//        title.frame = CGRect(x: 2, y: contentView.frame.size.height - 5, width: 50, height: 40)
      
        
    }
}

