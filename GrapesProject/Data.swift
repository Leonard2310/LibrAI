//
//  Data.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 07/03/24.
//

import Foundation
import SwiftUI
import Observation
import EPUBKit

@Observable
class SharedData {
    
    var Books = [
        book(title: "A Game of Thrones", cover: "GoT-I&F", lastBackground: "GoT_Background"),
        book(title: "The Lord of the Rings", cover: "lotr", lastBackground: "HPIII_Background"),
        book(title: "Harry Potter 3", cover: "HPIII", lastBackground: "LOTR_Background")
    ]
    
    var Mice1 = [
        mouse(mouseName: "Pirate Mouse", mouseImage: "Pirate Mouse"),
        mouse(mouseName: "King Mouse", mouseImage: "KingMouse"),
        mouse(mouseName: "Darth Mouse", mouseImage: "DarthMouse"),
        mouse(mouseName: "Magic Mouse", mouseImage: "Magic Mouse"),
        mouse(mouseName: "Unicorn Mouse", mouseImage: "unicorn mouse"),
        mouse(mouseName: "Wizard Of OZ Mouse", mouseImage: "wizard of oz Mouse")
    ]
    
    var Mice2 = [
        mouse(mouseName: "Pirate Mouse", mouseImage: "Pirate Mouse"),
        mouse(mouseName: "King Mouse", mouseImage: "KingMouse"),
        mouse(mouseName: "Darth Mouse", mouseImage: "DarthMouse"),
        mouse(mouseName: "Magic Mouse", mouseImage: "Magic Mouse"),
        mouse(mouseName: "Unicorn Mouse", mouseImage: "unicorn mouse"),
        mouse(mouseName: "Wizard Of OZ Mouse", mouseImage: "wizard of oz Mouse")
    ]
    
    var ChallengeMice = [
        mouse(mouseName: "Pirate Mouse", mouseImage: "Pirate Mouse"),
        mouse(mouseName: "King Mouse", mouseImage: "KingMouse"),
        mouse(mouseName: "Darth Mouse", mouseImage: "DarthMouse"),
        mouse(mouseName: "Magic Mouse", mouseImage: "Magic Mouse"),
        mouse(mouseName: "Unicorn Mouse", mouseImage: "unicorn mouse"),
        mouse(mouseName: "Wizard Of OZ Mouse", mouseImage: "wizard of oz Mouse")
    ]
}
 var sharedData = SharedData()

