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

//json을 디코딩 하기 위해 추가 작업필요 - codable을 쓸 수 있지만, 서버에 보내지 않으므로 인코딩하지 않음. 
struct Article: Decodable {
    let title: String
    let description: String
}
