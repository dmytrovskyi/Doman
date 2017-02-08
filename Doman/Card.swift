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
    var image: UIImage
    
    init(_ label: String, _ image: UIImage) {
        self.label = label.uppercased()
        self.image = image
    }
    
    struct PropertyKey {
        static let label = "label"
        static let image = "image"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(label, forKey: PropertyKey.label)
        aCoder.encode(image, forKey: PropertyKey.image)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let label = aDecoder.decodeObject(forKey: PropertyKey.label) as? String else {
            os_log("Unable to decode the Label for a Card object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage else {
            os_log("Unable to decode the Image for a Card object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(label, image)
    }
}
