//
//  NewsController.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 25.09.2021.
//

import UIKit
import Alamofire



class NewsController: UIViewController {

    
    @IBOutlet weak var NewsTableView: UITableView!
    let newsService = NewsAPI()
    
    var news: [NewModels] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NewsTableView.register(R.Nib.newsBasic, forCellReuseIdentifier: R.Cell.news)
        
        newsService.getNews { [weak self] news in
            
        }
    }
}

extension NewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.news, for: indexPath)
    }
}

extension NewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? NewsTableViewCell)?.configure(with: self.news[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
