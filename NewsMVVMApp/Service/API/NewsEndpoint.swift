//
//  NewsEndpoint.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation

protocol API {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsEndpoint {
    case fetchNews
}

extension NewsEndpoint: API {
    var urlRequest: URLRequest {
        return URLRequest(url: baseUrl.appendingPathComponent(path))
    }
    
    var baseUrl: URL {
        return URL(string: "https://api.lil.software")!
    }
    
    var path: String {
        switch self {
        case .fetchNews:
            return "/news"
        }
    }
    
    
}
