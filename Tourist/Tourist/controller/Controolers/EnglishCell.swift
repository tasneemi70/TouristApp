//
//  EnglishCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit


class EnglishCell: UICollectionViewCell {
    
    
    static let identfir = "cell2"
  
    private let bookImage2: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image = UIImage(named: "11")
        bookImage.layer.borderWidth = 1
        bookImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        bookImage.layer.cornerRadius = 20
        bookImage.backgroundColor = .systemTeal
        
        return bookImage
    }()
    
    private let nameLabel2: UILabel = {
        let namebook = UILabel()
        namebook.text = ""
        namebook.font = UIFont(name: "", size: 16.0)
        namebook.textColor = .black
        namebook.textAlignment = .center
        namebook.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        namebook.layer.cornerRadius = 25
        namebook.layer.masksToBounds = true
        
        return namebook
        
    }()
    
    func setCell2(book2: EnglishBook) {
        bookImage2.image = UIImage(named: book2.image)
        nameLabel2.text = book2.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bookImage2)
        contentView.addSubview(nameLabel2)
        contentView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        bookImage2.frame = CGRect(x: 1, y: 0, width: 170, height: 190)
        nameLabel2.frame = CGRect(x: 5, y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 10, height: 40)
//        nameLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10)
       
    }
}


