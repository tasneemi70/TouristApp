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
//        label.layer.cornerRadius = .maximumMagnitude(30, 20)
        label.font = UIFont(name: "AvenirNextCondensed-Medium", size:    16.0)
        label.textAlignment = .left
      //  label.backgroundColor = UIColor(named: "Color")
//        label.backgroundColor = .cyan
//        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints =
        label.textColor == .black
        label.layer.masksToBounds = true
        return label
    }()
    

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//      contentView.backgroundColor = .black
//      contentView.addSubview(comment)
//      NSLayoutConstraint.activate([
//        comment.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//        comment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//      ])
////      Comment.frame = CGRect(x: 1,
////                y: 10 ,
////                width: 50,
////                height: 50)
//}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      
        contentView.addSubview(comment)
      }
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      override func layoutSubviews() {
        super.layoutSubviews()
//          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        //left right
          NSLayoutConstraint.activate([
            comment.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            comment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
          ])
      }
   
}

