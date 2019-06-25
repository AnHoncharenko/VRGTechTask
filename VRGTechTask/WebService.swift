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
    
    func mostPopular(cl: @escaping ([NewsModel]) -> Void) {
        let url = Config.baseUrl + "/svc/mostpopular/v2/shared/30.json"
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
