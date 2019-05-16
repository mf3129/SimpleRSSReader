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
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var parsercompletionHandler:(([(title: String, description: String, pubDate: String)]) -> Void)?
    
    
    //Getting the URL and making URL request/ Set delegate
    func parseFeed(feedURL: String, completionHandler: (([(title: String, description: String, pubDate: String)]) -> Void)?) -> Void {
        
        self.parsercompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: feedURL)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            //PARSE XML data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
        }
        
        task.resume()
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        rssItems = []
    }
    
    //Once item found, we clear the labels to prepare for storage
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if currentElement == rssTag.item.rawValue {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    
    //Appending data from character found to variables
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case rssTag.title.rawValue: currentTitle += string
        case rssTag.description.rawValue: currentDescription += string
        case rssTag.pubDate.rawValue: currentPubDate += string
        default: break
        }
    }
    
    
    
    
    
}
