//
//  Article.swift
//  rsa83_NYTNewsApp
//
//  Created by Robel S. Ayalew on 5/14/20.
//  Copyright © 2020 Robel S. Ayalew. All rights reserved.
//

import UIKit

struct Article: Codable {
    var web_url: String
    var snippet: String
    var pub_date: String
    var abstract: String
    var lead_paragraph: String
}

struct Meta: Codable {
    var hits: Int
    var offset: Int
    var time: Int
}

struct Response: Codable {
    var docs: [Article]
    var meta: Meta
}

struct Answer: Codable {
    var copyright: String
    var response: Response
    var status: String
}

