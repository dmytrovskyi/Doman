//
//  Category.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/9/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import UIKit
import os.log


class  Category: NSObject, NSCoding {
    var name: String
    var cards: [Card]
    var imageURL: URL {
        get{
            return Settings.DocumentsDirectory.appendingPathComponent(uuid + Settings.imageFormat)
        }
    }
    
    var image: UIImage? {
        get{
            return UIImage(contentsOfFile: Settings.DocumentsDirectory.appendingPathComponent(uuid + Settings.imageFormat).path)
        }
    }
    var uuid: String
    
    init(name: String, cards: [Card], uuid: String) {
        self.name = name
        self.cards = cards
        self.uuid = uuid
    }
    
    init(name: String, uuid: String) {
        self.name = name
        self.uuid = uuid
        self.cards = [Card]()
    }
    
    struct PropertyKey {
        static let name = "name"
        static let uuid = "uuid"
        static let cards = "cards"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(uuid, forKey: PropertyKey.uuid)
        aCoder.encode(cards, forKey: PropertyKey.cards)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the Name for a Property object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let uuid = aDecoder.decodeObject(forKey: PropertyKey.uuid) as? String else {
            os_log("Unable to decode the Image for a Property object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let cards = aDecoder.decodeObject(forKey: PropertyKey.cards) as? [Card] else {
            os_log("Unable to decode the Cards for a Property object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(name: name, cards: cards, uuid: uuid)
    }
    
    
}
