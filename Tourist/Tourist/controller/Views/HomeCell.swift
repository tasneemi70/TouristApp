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
    imageC.layer.borderColor = .init( UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3).cgColor)
// red: 230/255, green: 237/255, blue: 184/255, alpha: 1
    imageC.layer.cornerRadius = 10
    imageC.backgroundColor = UIColor(red: 0.02, green: 0.22, blue: 0.31, alpha: 0.3)
    imageC.layer.cornerRadius = .minimumMagnitude(20, 20)

    return imageC
}()
    
override func layoutSubviews() {
    super.layoutSubviews()

    self.addSubview(imageC)
    imageC.frame = CGRect(x: 2, y: 7, width: 380, height: 300)

}
}
