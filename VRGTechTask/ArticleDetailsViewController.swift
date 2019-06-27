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
    var data:[NewsModel] = []
    var url:String = ""
    var favoritStat = true
    var starButton: UIBarButtonItem!
    
    static func show(on viewController: UIViewController, url: String) {
        let storydoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storydoard.instantiateViewController(withIdentifier: "details") as! ArticleDetailsViewController
        vc.url = url
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        let request = URLRequest(url: URL.init(string: url)!)
        self.webView.loadRequest(request)
        starButton = UIBarButtonItem(image: UIImage(named: "pullStar"),
                                     style: .done,
                                     target: self,
                                     action: #selector(favoritStatus))
        navigationItem.rightBarButtonItem = starButton

    }
    @objc func favoritStatus() {
        starButton.image = UIImage(named: "emptyStar")
        
    }
}
