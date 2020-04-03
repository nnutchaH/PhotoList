//
//  PhotoListData.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 1/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation

// MARK: - The500Px
struct The500Px: Codable {
    let photos: [PhotoListData]

    enum CodingKeys: String, CodingKey {
        case photos
    }
}

// MARK: - Photo
struct PhotoListData: Codable {
    let imageURL: [String]
    let name: String
    let photoDescription: String
    let positiveVotesCount: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
        case photoDescription = "description"
        case positiveVotesCount = "positive_votes_count"
    }
}



