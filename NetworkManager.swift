//
//  NetworkManager.swift
//  rsa83_NYTNewsApp
//
//  Created by Robel S. Ayalew on 5/14/20.
//  Copyright © 2020 Robel S. Ayalew. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ExampleDataResponse<T: Any> {
    case success(data: T)
    case failure(error: Error)
}

class NetworkManager {

    private static let NYTArticleURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json?fl=lead_paragraph,abstract,web_url,pub_date,snippet&api-key=KDdAFMsfbkyfva1CXTBZH99uujpRZWee"

    static func getArticle(didGetArticles: @escaping (([Article]) -> Void)) {
        AF.request(NYTArticleURL, method: .get).validate().responseData { (response) in
            switch response.result {
            
            case .success(let data):
                let decoder = JSONDecoder()
                
                if let articlesData = try? decoder.decode(Answer.self, from: data) {
                    didGetArticles(articlesData.response.docs)

                }
                else{
                    print("Cannot")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

}
