//
//  ArticleDetailsViewController.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/26/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var data: ContentModel!
    var starButton: UIBarButtonItem!
    
    static func show(on viewController: UIViewController, data: ContentModel) {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "details") as! ArticleDetailsViewController
        vc.data = data.clone()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        self.webView.loadHTMLString(data.html, baseURL: nil)
        
        starButton = UIBarButtonItem(image: nil,
                                     style: .done,
                                     target: self,
                                     action: #selector(addInFavorit))
        navigationItem.rightBarButtonItem = starButton
        updateFavoriteStatus()
    }
    
    func updateFavoriteStatus() {
        if DataBaseService.shared.isDBFavorit(id: data.id) {
            starButton.image = UIImage(named: "pullStar")
        } else {
            starButton.image = UIImage(named: "emptyStar")
        }
    }

    @objc func addInFavorit() {
        if DataBaseService.shared.isDBFavorit(id: data.id) {
            DataBaseService.shared.delete(data.id)
        } else {
            DataBaseService.shared.addModel(model: data.clone())
        }
        updateFavoriteStatus()
    }
}
