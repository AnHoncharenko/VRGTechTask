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

    var refreshControl = UIRefreshControl()
    @IBOutlet weak var loadingState: UIView!
    
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
            self.loadingState.isHidden = true
            self.tableView.reloadData()
        })
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    @objc func refresh() {
        WebService.shared.mostPopular(type: contentType, cl: {
            self.data = $0
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
}

extension NewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.givingData(model: data[indexPath.row])
        if (indexPath.row % 2) == 1 {
            cell.favoritStatrus.isHidden = true
        }
        return cell
    }
}
extension NewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ArticleDetailsViewController.show(on: self, url: data[indexPath.row].url)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let addFavorits = UITableViewRowAction(style: .destructive, title: "add") { (action , indexPath) in  }
        addFavorits.backgroundColor = UIColor.green
        return [addFavorits]
    }
}



