//
//  File.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 04/05/1443 AH.
//
//

import UIKit
class collectionViewCell : UICollectionViewCell {
    
    static let identfire = "collectionViewCell"
    
 let imageC: UIImageView = {
    let imageC = UIImageView()
    imageC.image = UIImage(named: "a1")
    imageC.layer.borderWidth = 1
    imageC.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
    imageC.layer.cornerRadius = 10
    imageC.backgroundColor = .systemTeal
    imageC.layer.cornerRadius = .minimumMagnitude(20, 20)

    return imageC
}()
    
override func layoutSubviews() {
    super.layoutSubviews()

    self.addSubview(imageC)
    imageC.frame = CGRect(x: 1, y: 5, width: 380, height: 200)

}
}
