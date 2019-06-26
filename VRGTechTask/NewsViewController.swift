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
        switch contentType {
        case .emailed: vc.title = "most emailed"; vc.tabBarItem.image = UIImage(named: "emailed")
        case .shared: vc.title = "most shared"; vc.tabBarItem.image = UIImage(named: "shared")
        case .viewed: vc.title = "most viewed"; vc.tabBarItem.image = UIImage(named: "viewed")
        }
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
    }
}

extension NewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.givingData(model: data[indexPath.row])
        return cell
    }
}
extension NewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ArticleDetailsViewController.show(on: self, url: data[indexPath.row].url)
    }
}



