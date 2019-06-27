//
//  FavoritsNewsViewController.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/26/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import UIKit

class FavoritsNewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let data = DataBaseService.shared.read()
    
    
    static func create() -> FavoritsNewsViewController {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "favorits") as! FavoritsNewsViewController
        vc.title = "favorits"; vc.tabBarItem.image = UIImage(named: "favorit")
        return vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension FavoritsNewsViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.givingData(model:NewsModel.init(title: data[indexPath.row].title, subtitle: data[indexPath.row].subtitle))
        return cell
    }
}
extension FavoritsNewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ArticleDetailsViewController.show(on: self, data: data[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action , indexPath) in
            DataBaseService.shared.delete(self.data[indexPath.row].id)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [delete]
    }
}
