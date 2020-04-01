//
//  PhotoListRequest.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 1/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation
import Moya

class Network {
    
    let provider = MoyaProvider<PhotoList>()
    
    func requestPhotoList(callback: ((Result<The500Px, Error>) -> Void)?) {
        
        provider
            .request(
                .feature ) { result in

                switch result
                {
                case .success(let response):
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601

                    do
                    {
                        let data = try jsonDecoder.decode(The500Px.self, from: response.data)
                        
                         callback?(.success(data))
                    }
                    catch
                    {
                        callback?(.failure(error))
                    }

                case .failure(let error):

                    callback?(.failure(error))
                }
            }
    }
}
