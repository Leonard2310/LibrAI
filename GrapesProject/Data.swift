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
        book(title: "A Game of Thrones", cover: "GoT-I&F", author: "George R. R. Martin", lastBackground: "GoT_Background"),
        book(title: "The Lord of the Rings", cover: "lotr", author: "J. R. R. Tolkien", lastBackground: "LOTR_Background"),
        book(title: "Harry Potter 3", cover: "HPIII", author: "J. K. Rowling", lastBackground: "HPIII_Background"),
        book(title: "Percy Jackson", cover: "Percy Jackson", lastBackground: "GoT_Background"),
        book(title: "Little Prince", cover: "Little Prince", lastBackground: "LOTR_Background"),
        book(title: "The Talisman", cover: "The Talisman", lastBackground: "HPIII_Background")
    ]
    
    var LastReadBooks = [
        book(title: "A Game of Thrones", cover: "GoT-I&F", author: "George R. R. Martin", lastBackground: "GoT_Background"),
        book(title: "The Lord of the Rings", cover: "lotr", author: "J. R. R. Tolkien", lastBackground: "LOTR_Background"),
        book(title: "Harry Potter 3", cover: "HPIII", author: "J. K. Rowling",lastBackground: "HPIII_Background")
    ]
    
    var Mice = [
        mouse(mouseName: "Buccaneer Mouse", mouseImage: "Pirate Mouse", mouseDescription: "Avast, ye curious reader! You’ve sailed through the tattered pages of pirate lore—the creaking timbers, the scent of brine, and the glint of doubloons. As you close “The Corsair’s Code,” a jolly roger unfurls in your heart—a symbol of adventure and hidden treasures.\n\nOur pint-sized mariner, clad in a tricorn hat and a patch over one eye, brandishes a tiny cutlass—the blade that sings with tales of sunken galleons and buried chests.\nHis fur, as weathered as old sails, conceals secrets whispered by the Kraken and the Trade Winds. His whiskers twitch with anticipation as he charts courses to forgotten islands, where X marks the spot and parrots squawk ancient riddles.\nSo splice the mainbrace, dear reader, and may your compass always point toward adventure. 🌊🗺️\n\nNote: the Buccaneer Mouse’s legacy sails beyond maps, and his laughter echoes across the Seven Seas. Yo-ho-ho! 🏴‍☠️", mouseSubtitle: "The Corsair’s Code"), 
        mouse(mouseName: "King Mouse", mouseImage: "KingMouse"),
        mouse(mouseName: "Darth Mouse", mouseImage: "DarthMouse"),
        mouse(mouseName: "Magic Mouse", mouseImage: "Magic Mouse"),
        mouse(mouseName: "Unicorn Mouse", mouseImage: "unicorn mouse"),
        mouse(mouseName: "Wizard Of OZ Mouse", mouseImage: "wizard of oz Mouse"),
        mouse(mouseName: "Sherlock Mouse", mouseImage: "ds2"),
        mouse(mouseName: "Narnia Mouse", mouseImage: "narnia2"),
        mouse(mouseName: "Fantasy Mouse", mouseImage: "ff1"),
        mouse(mouseName: "Explorer Mouse", mouseImage: "80days"),
        mouse(mouseName: "Lost World Mouse", mouseImage: "lostworld"),
        mouse(mouseName: "Eragon Mouse", mouseImage: "eragon3")
    ]
    
    
    var ChallengeMice = [
        mouse(mouseName: "Rich Mouse", mouseImage: "RichMouse"),
        mouse(mouseName: "Supportive Mouse", mouseImage: "GrapeMouse"),
        mouse(mouseName: "Editor Mouse", mouseImage: "EditorMouse"),
        mouse(mouseName: "Bug Fixer Mouse", mouseImage: "BugFixerMouse")
    ]
}
 var sharedData = SharedData()

