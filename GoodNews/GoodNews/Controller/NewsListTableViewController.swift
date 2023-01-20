//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Jooyoung Lee on 2023/01/20.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
}
