//
//  FriendCollectionViewCell.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    var friend : Friend? {
        didSet {
            var strName = ""
            if let title = friend?.name?.title {
                strName.append("\(title) ")
            }
            if let first = friend?.name?.first {
                strName.append("\(first) ")
            }
            if let last = friend?.name?.last {
                strName.append("\(last) ")
            }
            name.text = strName
            country.text = friend?.location?.country
            if let thumbnail = friend?.picture?.thumbnail {
                thumbnailView.imageFromServerURL(thumbnail, placeHolder: UIImage(named: "avatar"))
            }
            thumbnailView.layer.masksToBounds = true
            thumbnailView.layer.cornerRadius = 50
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = UIColor.black.cgColor
            borderView.layer.cornerRadius = 8
        }
      }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
