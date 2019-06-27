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
    
    
    
    func isDBFavorit(id: String) -> Bool {
        return !realm.objects(FavoritModel.self).filter("id = '\(id)'").isEmpty
    }

    func read() -> Results<FavoritModel> {
        return realm.objects(FavoritModel.self)
    }
    
    func addModel(model: FavoritModel) {
        try? realm.write {
            realm.add(model)
        }
    }
    
    func delete(_ id: String) {
        guard let model = realm.objects(FavoritModel.self).filter("id = '\(id)'").first else { return }
        try? realm.write {
            realm.delete(model)
        }
    }

    
    
}
