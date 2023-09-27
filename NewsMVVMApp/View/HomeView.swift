//
//  HomeView.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView {
                    Text("Fetching News...")
                }
            case .failed(let error):
                ErrorView(error: error,
                          buttonHandler: viewModel.fetchArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.fetchArticles)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
