//
//  Utils.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/7/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import Foundation

class Utils {

    static func loadCards() -> [Card] {
        if let cards = NSKeyedUnarchiver.unarchiveObject(withFile: Settings.ArchiveURL.path) as? [Card] {
            return cards
        } else {
            return [Card]()
        }
    }
    
    
}
