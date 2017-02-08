//
//  Settings.swift
//  Doman
//
//  Created by Vyacheslav Dmitrovskiy on 2/2/17.
//  Copyright © 2017 Vyacheslav Dmitrovskiy. All rights reserved.
//

import Foundation


class Settings {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("cards1")

}
