//
//  Article.swift
//  GoodNews
//
//  Created by 사용자 on 2023/01/27.
//

import Foundation


struct ArticleList: Decodable {
    let articles: [Article]
    
}
struct Article: Decodable {
    let title: String
    let description: String
}
