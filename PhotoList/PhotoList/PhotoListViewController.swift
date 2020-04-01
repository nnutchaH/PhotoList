//
//  ViewController.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 1/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {

    let network = Network()
    var photoListData: [PhotoListData] = [PhotoListData(imageURL: [], name: "", photoDescription: "", positiveVotesCount: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network
            .requestPhotoList(callback: { [weak self] in
            self?.handleResponse(result: $0) })
        
    }

    private func handleResponse(result: Result<The500Px, Error>)
    {
        switch result
        {
        case .success(let data):
            photoListData = data.photos
        case .failure(let error):
            print("error: \(error)")
        }
    }
}

