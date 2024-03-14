//
//  Book.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 07/03/24.
//

import Foundation

struct book:Identifiable{
    var id = UUID()
    var title:String
    var urlCover: URL? = nil
    var cover:String = "nocover"
    var author:String = "None"
    var read_time:Int = 1 //da rivedere. è a caso
    var last_chapter:Int = 0
    var lastBackground: String = "noimage"
}
