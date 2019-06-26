//
//  FirstViewController.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/25/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data: [NewsModel] = []
    var contentType: MostPopularType = .shared
    
    
    static func create(contentType: MostPopularType) -> NewsViewController {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "news") as! NewsViewController
        vc.contentType = contentType
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebService.shared.mostPopular(type: contentType, cl: {
            self.data = $0
            self.tableView.reloadData()
        })
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        switch contentType {
        case .emailed: title = "most emailed"
        case .shared: title = "most shared"
        case .viewed: title = "most viewed"
        }
    }
}

extension NewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.givingData(model: [data[indexPath.row]])
        return cell
    }
}
extension NewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch contentType {
        case .emailed: ArticleDetailsViewController.create(viewController: self, url: data[indexPath.row].url)
        case .shared: ArticleDetailsViewController.create(viewController: self, url: data[indexPath.row].url)
        case .viewed: ArticleDetailsViewController.create(viewController: self, url: data[indexPath.row].url)
        }
    }
}

class NewsCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    
    func givingData(model: [NewsModel]) {
        title.text = model[0].title
        subtitle.text = model[0].subtitle
    }
}

