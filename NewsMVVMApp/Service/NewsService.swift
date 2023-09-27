//
//  NewsService.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsEndpoint) -> AnyPublisher<NewsAPIResponse, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsEndpoint) -> AnyPublisher<NewsAPIResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<NewsAPIResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsAPIResponse.self,
                                decoder: decoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.httpError(code: response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
