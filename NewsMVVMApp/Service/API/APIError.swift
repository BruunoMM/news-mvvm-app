//
//  APIError.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(code: Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode response"
        case .httpError(let code):
            return "Received error code \(code) response from API"
        case .unknown:
            return "Unknown error occured"
        }
    }
}
