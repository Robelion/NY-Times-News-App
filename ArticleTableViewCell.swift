//
//  ArticleTableViewCell.swift
//  rsa83_NYTNewsApp
//
//  Created by Robel S. Ayalew on 5/14/20.
//  Copyright © 2020 Robel S. Ayalew. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    let headlineMain = UILabel()
    let date = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        let marginGuide = contentView.layoutMarginsGuide

        contentView.addSubview(headlineMain)
        headlineMain.translatesAutoresizingMaskIntoConstraints = false
        headlineMain.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        headlineMain.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        headlineMain.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        headlineMain.numberOfLines = 0

        contentView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        date.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        date.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        date.topAnchor.constraint(equalTo: headlineMain.bottomAnchor).isActive = true
        date.numberOfLines = 0
        date.textColor = UIColor.lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
