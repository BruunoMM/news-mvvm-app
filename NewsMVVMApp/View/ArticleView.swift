//
//  ArticleView.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 26/09/23.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageURL = article.image,
               let url = URL(string: imageURL) {
                URLImage(url,
                         failure: { _, _ in ImagePlaceholderView() },
                         content: { image, info in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }).environment(\.urlImageOptions, URLImageOptions(
                    fetchPolicy: .returnStoreElseLoad(downloadDelay: 0.1)
                ))
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                ImagePlaceholderView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "")
                    .lineLimit(3)
                    .font(.footnote)
            }
        }
    }
}

struct ImagePlaceholderView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummy)
            .previewLayout(.sizeThatFits)
    }
}
