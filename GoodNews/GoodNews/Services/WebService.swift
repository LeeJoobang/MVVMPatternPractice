//
//  WebServices.swift
//  GoodNews
//
//  Created by 사용자 on 2023/01/27.
//

import Foundation

class WebService {
    
    func getArticle(url: URL, completion: @escaping ([Any]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print("data:\(data)")
            }
        }.resume()
    }
}
