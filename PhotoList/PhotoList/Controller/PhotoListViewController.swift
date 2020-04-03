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
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    let network = Network()
    
    var photoListData: [PhotoListData] = []
    
    var page = 1
    
//    var count = 4
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "InsertImageTableViewCell", bundle: nil), forCellReuseIdentifier: "InsertImageTableViewCell")
        
        network
            .requestPhotoList(page: page, callback: { [weak self] in
                self?.handleResponse(result: $0) })
        
    }
    
    private func handleResponse(result: Result<The500Px, Error>) {
        switch result {
        case .success(let data):
            self.photoListData.append(contentsOf: data.photos)
            self.tableView.reloadData()
            self.loadingView.isHidden = true
            self.page += 1
        case .failure(let error):
            print("error: \(error)")
            self.loadingView.isHidden = true
        }
    }
}

extension PhotoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoListData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        if indexPath.row == count  {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "InsertImageTableViewCell", for: indexPath) as! InsertImageTableViewCell
//
//            self.count += 5
//            return cell
//        }
//        else {
//
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoListTableViewCell", for: indexPath) as! PhotoListTableViewCell
            
            let photoList = photoListData[indexPath.row]
            
            cell.setupUI(photoList: photoList)
            
            cell.nameLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(500))
            
            return cell
//        }
        
    }
    
}

extension PhotoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == photoListData.count - 1 && loadingView.isHidden {
            
            loadingView.isHidden = false
            
            network.requestPhotoList(page: page, callback: { [weak self] in
                self?.handleResponse(result: $0) })
        }
    }
}

