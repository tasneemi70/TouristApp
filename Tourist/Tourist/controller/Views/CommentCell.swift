//
//  CommentCell.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 02/06/1443 AH.
//

import UIKit

class CommentCell: UITableViewCell {
    
    static var identifire = "commentCell"
    
    var comment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNextCondensed-Medium", size:    16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints =
        label.textColor == .black
        label.layer.masksToBounds = true
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      
        contentView.addSubview(comment)
      }
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      override func layoutSubviews() {
        super.layoutSubviews()
          NSLayoutConstraint.activate([
            comment.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            comment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
          ])
      }
   
}

