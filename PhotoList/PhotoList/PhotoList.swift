//
//  PhotoListAPIManager.swift
//  PhotoList
//
//  Created by Pony💛 yyy on 1/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//
//https://api.500px.com/v1/photos?feature=popular&page=1

import Foundation
import Moya

enum PhotoList {
    case feature
}

extension PhotoList: TargetType {
    var baseURL: URL {
        return URL(string:  "https://api.500px.com")!
    }
    
    var path: String {
        switch self {
        case .feature:
            return "/v1/photos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .feature:
            return .requestParameters(parameters: ["feature": "popular", "page": "1"], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
           return Data()
       }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
