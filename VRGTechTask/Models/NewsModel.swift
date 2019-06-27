//
//  NewsModel.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/25/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NewsModel {
    let id: String
    let title: String
    let subtitle: String
    let url: String
    
    init(json: JSON) {
        id = json["id"].stringValue
        title = json["title"].stringValue
        subtitle = json["abstract"].stringValue
        url = json["url"].stringValue
    }
    
    init(title: String, subtitle: String) {
        self.id = ""
        self.title = title
        self.subtitle = subtitle
        self.url = ""
    }
}
