//
//  ResultState.swift
//  NewsMVVMApp
//
//  Created by br.marinho on 25/09/23.
//

import Foundation

enum ResultState {
    case loading
    case success(_ articles: [Article])
    case failed(error: Error)
}
