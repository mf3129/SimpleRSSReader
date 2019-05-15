//
//  FeedParser.swift
//  SimpleRSSReader
//
//  Created by Makan fofana on 5/14/19.
//  Copyright © 2019 MakanFofana. All rights reserved.
//

import Foundation
import UIKit


typealias ArticleItem = (title: String, description: String, pubDate: String)

//Enums for XML tags we want
enum rssTag: String {
    case item = "Item"
    case title = "Title"
    case description = "description"
    case pubDate = "pubDate"
}



class FeedParser: NSObject, XMLParserDelegate {
    
    private var rssItems: [ArticleItem] = []
    private var currentElement = ""
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    
    
    
}
