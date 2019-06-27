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
    var data:NewsModel?
    var favoritStat = true
    var starButton: UIBarButtonItem!
    
    static func show(on viewController: UIViewController, data: NewsModel) {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "details") as! ArticleDetailsViewController
        vc.data = data
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        let request = URLRequest(url: URL.init(string: data!.url)!)
        self.webView.loadRequest(request)
        starButton = UIBarButtonItem(image: UIImage(named: "emptyStar"),
                                     style: .done,
                                     target: self,
                                     action: #selector(addInFavorit))
        navigationItem.rightBarButtonItem = starButton

    }
    @objc func addInFavorit() {
        starButton.image = UIImage(named: "pullStar")
        DataBaseService.shared.addModel(model: data!)
    }
}
