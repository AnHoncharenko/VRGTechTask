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
    
    static func create() -> FavoritsNewsViewController {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "favorits") as! FavoritsNewsViewController
        vc.title = "favorits"; vc.tabBarItem.image = UIImage(named: "favorit")
        return vc
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.givingData(model: NewsModel.init(title: "123456789012", subtitle: "12831837183781273871289378912738172387127391723871823"))
        return cell
    }
}
extension FavoritsNewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action , indexPath) in }
        return [delete]
    }
}
