//
//  File.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 04/05/1443 AH.
//
//
//
import UIKit
class collectionViewCell : UICollectionViewCell {
    static let identfire = "collectionViewCell"
        
        let imageC: UIImageView = {
            let imageC = UIImageView()
           imageC.layer.borderWidth = 1
           imageC.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
            imageC.layer.cornerRadius = 10
            imageC.backgroundColor = .white
            imageC.layer.cornerRadius = .minimumMagnitude(20, 20)
            imageC.clipsToBounds = true
            imageC.layer.masksToBounds = true
            return imageC
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(imageC)
            imageC.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageC.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                imageC.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                imageC.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
                imageC.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
                
            ])
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
    }
