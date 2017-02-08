//
//  CardService.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/8/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//
import UIKit
import os.log


class CardService{

    static func saveCard(label: String, image: UIImage) -> Bool {
        let fileName = String(format: "%@.jpg", label)
        let destinationPath = Settings.DocumentsDirectory.appendingPathComponent(fileName)
        
        do {
            try UIImageJPEGRepresentation(image, 1.0)!.write(to: destinationPath)
            
            let card = Card(label, destinationPath)
            var cards = Utils.loadCards()
            cards.append(card)
            NSKeyedArchiver.archiveRootObject(cards, toFile: Settings.ArchiveURL.path)
            
            os_log("Card successfully saved.")
            
            return true
        } catch {
            os_log("Failed to save card...")
            return false
        }
    }
    
}
