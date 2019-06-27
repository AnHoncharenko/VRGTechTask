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
    var title: String
    var subtitle: String
    var url: String
    
    init(json: JSON) {
        title = json["title"].stringValue
        subtitle = json["abstract"].stringValue
        url = json["url"].stringValue
    }
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.url = ""
    }
    
    
    
}
