//
//  ErrorView.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 26/09/23.
//

import SwiftUI

struct ErrorView: View {
    typealias VoidActionHandler = () -> Void
    
    let error: Error
    let buttonHandler: VoidActionHandler
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 2)
            Text("Ops!")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .padding(.bottom, 4)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.caption)
                .multilineTextAlignment(.center)
            Button {
                buttonHandler()
            } label: {
                Text("Retry")
                    .foregroundColor(.white)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(.cyan)
            .font(.headline)
            .cornerRadius(12)

                
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
