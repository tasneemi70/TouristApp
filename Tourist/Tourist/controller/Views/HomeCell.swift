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
