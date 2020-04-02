//
//  PhotoListTableViewCell.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 2/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

class PhotoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageURL: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var positiveVoteLabel: UILabel!
    
    func setupUI(photoList: PhotoListData) {
        
        let url = URL(string: photoList.imageURL[0])
        imageURL.kf.setImage(with: url)
        nameLabel.text = photoList.name
        descriptionLabel.text = photoList.photoDescription
        positiveVoteLabel.text = String(photoList.positiveVotesCount)
        
    }
}
