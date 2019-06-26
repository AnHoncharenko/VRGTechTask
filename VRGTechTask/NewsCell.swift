//
//  NewsCell.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/26/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    func givingData(model: NewsModel) {
        title.text = model.title
        subtitle.text = model.subtitle
    }
}
