//
//  WebServices.swift
//  GoodNews
//
//  Created by 사용자 on 2023/01/27.
//

import Foundation

class WebService {
    
    func getArticle(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print("data = \(data)")
                // 왜 모델에 만들어 넣을까? 곧바로 뷰모델에 전달하면 안될까? 뷰 모델 자체를 최대한 깨끗하게 둬야 한다. 뷰 모델에서는 웹서비스와 통신해야 하기 때문
                // 뷰모델은 단순하게 만들어 핸들링해야 한다. 정보를 분류해서 표시할 수 있는 기준 - 즉, 카테고리화, 인덱스
                // 우리는 json을 디코딩할 것인데, 어떤 타입으로 디코딩 할까?
                // json 디코딩시 에러 발생할 수 있으므로, try catch 진행
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    // 기사를 가져올 수 있음. 어디로?  getArticle을 호출하는 곳으로 우리는 내볼 수 있게 되었다.
                    // 이 정보를 뷰에서 표시한다면 우리는 화면에 뷰를 표시하게 되는 것이다.
                    // 결국 이 정보는 모델로 넘긴다. 왜? 바로 뷰로 안뿌리고? 모델은 UI 데이터를 제공하는 역할이기 때문
                    // 더불어 ui에 제공하는 모델은 가지고 있는 형태가 여러 모델을 가지고 있을 수 있다.
                    // 뷰 모델 안에서 여러 뷰에 대한 대응이 가능하게 된다.
                    // 정해진 뷰 모델은 모델의 정보가 어떻게 담길지 뷰를 기준으로 카테고리화, 인덱싱을 해준다.(반복)
                    // WebService().getArticle을 호출할 때, 클로져에서 작성된 파라미터 명에 아래의 Completion(articleList.articles)가 담길 것이다.
                    completion(articleList.articles)
                }
                
            }
        }.resume() // .resume하지 않을 경우 호출되지 않음.
    }
}
