//
//  Mouse.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 12/03/24.
//

import Foundation

struct mouse: Identifiable{
    var id = UUID()
    var mouseName: String
    var mouseImage: String
    var mouseDescription: String = "no description avaiable"
    var mouseSubtitle: String = ""
}
