//
//  FaforitModel.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/27/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import Foundation
import RealmSwift

class FavoritModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var subtitle = ""
    @objc dynamic var html = ""

    static func favoriteFrom(news: NewsModel, html: String ) -> FavoritModel {
        let data = FavoritModel()
        data.id = news.id
        data.title = news.title
        data.subtitle = news.subtitle
        data.html = html
        return data
    }
    
    func clone() -> FavoritModel {
        let data = FavoritModel()
        data.id = id
        data.title = title
        data.subtitle = subtitle
        data.html = html
        return data
    }
    
}
