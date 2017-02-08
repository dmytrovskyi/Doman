//
//  Card.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/2/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import UIKit
import os.log

class Card: NSObject, NSCoding {
    var label: String
    var imageUrl: URL
    
    
    init(_ label: String, _ imageUrl: URL) {
        self.label = label.uppercased()
        self.imageUrl = imageUrl
    }
    
    struct PropertyKey {
        static let label = "label"
        static let imageUrl = "imageUrl"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(label, forKey: PropertyKey.label)
        aCoder.encode(imageUrl, forKey: PropertyKey.imageUrl)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let label = aDecoder.decodeObject(forKey: PropertyKey.label) as? String else {
            os_log("Unable to decode the Label for a Card object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let imageUrl = aDecoder.decodeObject(forKey: PropertyKey.imageUrl) as? URL else {
            os_log("Unable to decode the Image for a Card object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(label, imageUrl)
    }
}
