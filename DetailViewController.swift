//
//  DetailViewController.swift
//  rsa83_NYTNewsApp
//
//  Created by Robel S. Ayalew on 5/15/20.
//  Copyright © 2020 Robel S. Ayalew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    
    
    var snippet: UILabel!
    var abstract: UILabel!
    var paragraph: UILabel!
    @IBOutlet var url: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Details"
        
        view.backgroundColor = .white
        snippet = UILabel()
        
        
        snippet.text = "Snippet: \n" + SearchViewController.GlobalVariable.snippet
        snippet.layer.borderColor = UIColor.black.cgColor
        snippet.layer.borderWidth = 0.5
        snippet.layer.cornerRadius = 15
        snippet.adjustsFontForContentSizeCategory = true
        snippet.numberOfLines = 0
        snippet.adjustsFontSizeToFitWidth = true
        snippet.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(snippet)
         
        abstract = UILabel()
        abstract.adjustsFontSizeToFitWidth = true
        abstract.text = "Published: \n" + SearchViewController.GlobalVariable.pub_date
        abstract.layer.borderColor = UIColor.black.cgColor
        abstract.layer.borderWidth = 0.5
        abstract.numberOfLines = 0
        abstract.layer.cornerRadius = 15
        abstract.adjustsFontForContentSizeCategory = true
        abstract.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(abstract)
        
        paragraph = UILabel()
        paragraph.adjustsFontSizeToFitWidth = true
        paragraph.layer.cornerRadius = 15
        paragraph.text = "Insight: \n" + SearchViewController.GlobalVariable.paragraph
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        paragraph.layer.borderColor = UIColor.black.cgColor
        paragraph.layer.borderWidth = 0.5
        paragraph.adjustsFontForContentSizeCategory = true
        paragraph.numberOfLines = 0
        view.addSubview(paragraph)
        
        
        
        url = UITextView()
        
        self.url.layer.cornerRadius = 15
        self.url.isEditable = false
        self.url.delegate = self
        self.url.dataDetectorTypes = .link
        self.url.isUserInteractionEnabled = true
        
        self.url.adjustsFontForContentSizeCategory = true
        self.url.text = "Read more here: \n" + SearchViewController.GlobalVariable.web_url
        self.url.backgroundColor = .white
        self.url.isSelectable = true
        self.url.layer.borderColor = UIColor.black.cgColor
        self.url.layer.borderWidth = 0.5
        self.url.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(url)
        
        setupConstraints()

    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        false
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }

    func setupConstraints() {
        
        let size = view.layer.frame.height
        
        NSLayoutConstraint.activate([
            abstract.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            abstract.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            abstract.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            abstract.heightAnchor.constraint(equalToConstant: size/6)
            ])
        
        NSLayoutConstraint.activate([
            snippet.topAnchor.constraint(equalTo: abstract.bottomAnchor, constant: 10),
            snippet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            snippet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            snippet.heightAnchor.constraint(equalToConstant: size/6)
            ])
        
        NSLayoutConstraint.activate([
            paragraph.topAnchor.constraint(equalTo: snippet.bottomAnchor, constant: 10),
            paragraph.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            paragraph.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            paragraph.heightAnchor.constraint(equalToConstant: size/6)
            ])
        
        NSLayoutConstraint.activate([
            url.topAnchor.constraint(equalTo: paragraph.bottomAnchor, constant: 10),
            url.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            url.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            url.heightAnchor.constraint(equalToConstant: size/6)
            ])
    
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
