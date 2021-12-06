//
//  ArabicCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit

class ArabicCell: UICollectionViewCell {
    
    static let identfir = "cell"
  
    private let bookImage: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image = UIImage(named: "1")
        bookImage.layer.borderWidth = 1
        bookImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        bookImage.layer.cornerRadius = 20
        bookImage.backgroundColor = .systemTeal
        
        return bookImage
    }()
    
    private let nameLabel: UILabel = {
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
    
    func setCell(book: Book) {
        bookImage.image = UIImage(named: book.image)
        nameLabel.text = book.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bookImage)
        contentView.addSubview(nameLabel)
        contentView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        bookImage.frame = CGRect(x: 1, y: 0, width: 170, height: 190)
        nameLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 10, height: 40)
//        nameLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10)
       
    }
}
