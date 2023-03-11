//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Jooyoung Lee on 2023/01/20.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController, UINavigationBarDelegate{
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-02-11&sortBy=publishedAt&apiKey=5e2cf60f55ef4e6ebbe521d9ec0ee227")!
        WebService().getArticle(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                // 테이블 뷰가 UI 메인스레드에서 로드 될 수 있도록 Dispatch.main.async로 보낸다.
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found")}
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
   
}
