//
//  CategoriesService.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/9/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import Foundation
import os.log

class CategoryService{
    private static var categories: [Category]?
    
    static func getAllCategoriesWithCards() -> [Category] {
        if let categories = categories {
            return categories
        } else {
            if let categories = NSKeyedUnarchiver.unarchiveObject(withFile: Settings.ArchiveURL.path) as? [Category] {
                CategoryService.categories = categories
            } else {
                CategoryService.categories = [Category]()
            }
            
            return CategoryService.categories!
        }
    }
}
