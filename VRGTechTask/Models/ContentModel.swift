//
//  ContentModel.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/27/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import Foundation
import RealmSwift

class ContentModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var subtitle = ""
    @objc dynamic var html = ""

    static func itemFrom(news: NewsModel, html: String ) -> ContentModel {
        let data = ContentModel()
        data.id = news.id
        data.title = news.title
        data.subtitle = news.subtitle
        data.html = html
        return data
    }
    
    func clone() -> ContentModel {
        let data = ContentModel()
        data.id = id
        data.title = title
        data.subtitle = subtitle
        data.html = html
        return data
    }
}
