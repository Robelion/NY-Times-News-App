//
//  ViewController.swift
//  rsa83_NYTNewsApp
//
//  Created by Robel S. Ayalew on 5/14/20.
//  Copyright © 2020 Robel S. Ayalew. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating, UITableViewDelegate {
    
    struct GlobalVariable{
        static var snippet = String()
        static var web_url = String()
        static var paragraph = String()
        static var pub_date = String ()
    }
    
    var tableView = UITableView()
    let articleCellIdentifier = "ArticleCell"
    var searchController: UISearchController!
    
    var articles: [Article] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Articles"

        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier:
            articleCellIdentifier)

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Abstract"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleCellIdentifier, for: indexPath) as! ArticleTableViewCell

        cell.headlineMain.text = articles[indexPath.row].abstract
        cell.date.text = articles[indexPath.row].pub_date

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        GlobalVariable.snippet = articles[indexPath.row].snippet
        GlobalVariable.pub_date = articles[indexPath.row].pub_date
        GlobalVariable.paragraph = articles[indexPath.row].lead_paragraph
        GlobalVariable.web_url = articles[indexPath.row].web_url
        
        self.navigationController?.pushViewController(vc, animated: true)

    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchHeadline = searchController.searchBar.text {
            if !searchHeadline.isEmpty {
                NetworkManager.getArticle { (articles_all) in
                    var articles_filtered: [Article] = []
                    for article in articles_all{
                        if article.abstract.contains(searchHeadline){
                            articles_filtered.append(article)
                        }
                        
                    }
                    self.articles = articles_filtered

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }
            else {
                NetworkManager.getArticle { (articles_all) in
                    
                    self.articles = articles_all

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        else{
            NetworkManager.getArticle { (articles_all) in
                
                self.articles = articles_all

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

    }


}


