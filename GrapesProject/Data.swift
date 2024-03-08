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
}
 var sharedData = SharedData()

