//
//  Article.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 23/02/2022.
//

import Foundation


struct Article: Decodable {
    let headline: String
    let urlToImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case headline = "title"
        case urlToImage = "urlToImage"
    }
}
