//
//  ViewController.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 1/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let network = Network()
    
    var photoListData: [PhotoListData] = []
//        = [PhotoListData(imageURL: [], name: "", photoDescription: "", positiveVotesCount: 0)]
    
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
            self.photoListData = data.photos
            tableView.reloadData()
        case .failure(let error):
            print("error: \(error)")
        }
    }
}

extension PhotoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoListData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoListTableViewCell", for: indexPath) as? PhotoListTableViewCell {
            
            let photoList = photoListData[indexPath.row]
            
            cell.setupUI(photoList: photoList)
            
            return cell
            
        }
        else {
            
            fatalError()
            
        }
    }
}

