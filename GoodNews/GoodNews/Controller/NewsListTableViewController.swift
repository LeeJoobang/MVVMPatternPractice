//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Jooyoung Lee on 2023/01/20.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController, UINavigationBarDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=5e2cf60f55ef4e6ebbe521d9ec0ee227")!
        WebService().getArticle(url: url) { _ in
            
        } 
    }
    
    
}
