//
//  NewsAPIResponse.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation

// MARK: - Welcome
struct NewsAPIResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let description: String?
    let image: String?
    let date: Date?
}

extension Article {
    static var dummy: Article {
        .init(author: "Eva Rothenberg, Chris Isidore",
              url: "https://www.cnn.com/2023/09/23/business/canada-automakers-ford-labor-deal/index.html",
              source: "CNN",
              title: "Canadian autoworkers approve labor deal with Ford - CNN",
              description: "Members of Canada’s autoworkers union, Unifor, ratified a tentative three-year agreement with Ford on Sunday after the union had reached an 11th-hour agreement last week to avert a possible strike.",
              image: "https://media.cnn.com/api/v1/images/stellar/prod/230923125819-lana-payne-unifor-union-0810-restricted.jpg?c=16x9&q=w_800,c_fill",
              date: Date())
    }
}
