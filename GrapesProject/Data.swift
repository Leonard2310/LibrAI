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
        book(title: "A Game of Thrones", cover: "GoT-I&F", lastBackground: "Back got"),
        book(title: "The Lord of the Rings", cover: "LotR", lastBackground: "Back lotr"),
        book(title: "Harry Potter 3", cover: "HPIII", lastBackground: "Back hp")
    ]
}
 var sharedData = SharedData()

