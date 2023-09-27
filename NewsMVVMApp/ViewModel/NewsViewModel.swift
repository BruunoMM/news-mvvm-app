//
//  NewsViewModel.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation
import Combine

protocol NewsViewModel {
    func fetchArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    
    private(set) var articles: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func fetchArticles() {
        state = .loading
        
        service.request(from: .fetchNews)
            .sink { result in
                switch result {
                case .finished:
                    self.state = .success(self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
            .store(in: &cancellables)
    }
}
