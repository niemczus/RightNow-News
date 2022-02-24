//
//  TopHeadlinesResponse.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 24/02/2022.
//

import Foundation


struct TopHeadlineResponse: Decodable {
    let articles: [Article]
}
