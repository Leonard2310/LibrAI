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
    let path = Bundle.main.url(forResource: "frankenstein", withExtension: "epub"),
        let document = EPUBDocument(url: path)
    var Books = [
        book(title: "A Game of Thrones", cover: "got"),
        book(title: "The Lord of the Rings", cover: "lotr"),
        book(title: "Harry Potter 3", cover: "hp")
    ]
}
 var sharedData = SharedData()

