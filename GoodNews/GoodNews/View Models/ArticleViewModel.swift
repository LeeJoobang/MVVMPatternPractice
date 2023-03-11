//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by 사용자 on 2023/01/27.
//

import Foundation

// viewmodel은 article을 담고 있음.
struct ArticleListViewModel {
    let articles: [Article]
}

// 몇줄을 표시할지, 몇개의 아티클을 보일지, 아티클의 index을 활용해 인덱스에 맞춰 모델을 보여준다.
// 이과정을 통해 뷰에 표시할 수 있는 모델의 형식의 작성됨. 몇줄을 표시하고, 몇개의 기사를 보이고, 어떤 순서로 보일지 알 수 있었다.
// 내가 받을 수 있는 api 중 순위를 보일 수 있는 것을 생각해보자.

extension ArticleListViewModel{ // articleListViewModel에 기능을 추가한다.
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}


// MARK: 모델의 정보를 뷰모델에 담아서 해당 뷰모델에서 ui에 표시하기 위한 조건
struct ArticleViewModel {
    // json으로 구성된 Article을 생성한다.
    private let article: Article
}

extension ArticleViewModel {
    //article을 초기화 시킴
    init(_ article: Article){
        self.article = article
    }
    
    var title: String { // viewmodel에 담긴 article을 viewmodel에서 초기화한 title에 담는다. description 역시 마찬가지이다.
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }

}

// 타이틀과 설명을 표시하기 위한 과정 진행
