//
//  NewsStory.swift
//  Stocks
//
//  Created by Main User on 06.07.2021.
//

import Foundation

struct NewsStory: Codable {
    let category: String
    let datetime: TimeInterval
    let headline: String
    let image: String
    let related: String
    let source: String
    let summary: String
    let url: String
}
