//
//  WebService.swift
//  
//
//  Created by Anton Honcharenko on 6/25/19.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebService {
    static let shared = WebService()
    let defaultUrlParam = ["api-key":Config.apiKey,]
    
    func loadContent(url: String, cl: @escaping (String) -> Void) {
        Alamofire.request(url, method: .get, parameters: defaultUrlParam)
            .validate(statusCode: 200..<300)
            .responseString { response in
                cl(response.value ?? "")
        }
    }

    
    func mostPopular(type: MostPopularType, cl: @escaping ([NewsModel]) -> Void) {
        let typeString: String
        switch type {
        case .emailed: typeString = "emailed"
        case .shared: typeString = "shared"
        case .viewed: typeString = "viewed"
        }
        let url = Config.baseUrl + "/svc/mostpopular/v2/\(typeString)/30.json"
        Alamofire.request(url, method: .get, parameters: defaultUrlParam)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                guard let data = response.data else { return }
                guard let json = try? JSON(data: data) else { return }
                let result = json["results"].arrayValue.map({ NewsModel(json: $0) })
                cl(result)
        }
    }
}
