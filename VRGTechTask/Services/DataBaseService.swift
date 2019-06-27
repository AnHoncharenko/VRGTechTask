//
//  DataBaseService.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/27/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import RealmSwift

class DataBaseService {
    static let shared = DataBaseService()
    let realm = try! Realm()
    
    
    
    func isFavorit(id: String) -> Bool {
        return !realm.objects(FaforitModel.self).filter("id = '\(id)'").isEmpty
    }

    func read() -> Results<FaforitModel> {
        return realm.objects(FaforitModel.self)
    }
    
    func addModel(model: NewsModel) {
        let realmData = FaforitModel()
        realmData.title = model.title
        realmData.subtitle = model.subtitle
        realmData.id = model.id
        try! realm.write {
            realm.add(realmData)
        }
    }
    
    func delete(_ model: FaforitModel) {
        try! realm.write {
            realm.delete(model)
        }
    }

    
    
}
