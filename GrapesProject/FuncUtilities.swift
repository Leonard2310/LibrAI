//
//  FuncUtilities.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 12/03/24.
//

import Foundation
import EPUBKit
import SwiftSoup

var path: URL?
var document: EPUBDocument?
var content: [String]?

func loadEPUBDocument(from path: URL?) -> EPUBDocument? {
    guard let path = path else {
        print("Unable to find the EPUB file.")
        return nil
    }
    guard let document = EPUBDocument(url: path) else {
        print("Invalid EPUB document.")
        return nil
    }
    dump(document)
    print(document.contentDirectory.absoluteString)
    return document
}

func extractCover(document: EPUBDocument?) -> URL? {
    return document!.cover!
}

func extractTitle(document: EPUBDocument!) -> String {
    if document.title != nil {
        return document!.title!
    }else{
        return "Title not available."
    }
}

func extractAuthor(document: EPUBDocument?) -> String {
    if document?.author != nil {
        return document!.author!
    }else{
        return "Author not available."
    }
}

func extractContent(document: EPUBDocument?) -> [String] {
    guard let document = document else {
        print("Unable to find the EPUB file.")
        return []
    }
    guard let bundle = Bundle(path: document.contentDirectory.path()) else {
        print("EPUB unresolved.")
        return []
    }
    let contentFiles = document.spine.items.compactMap { item in
        if let manifestItem = document.manifest.items.first(where: { (_, value) in item.idref == value.id }) {
            return bundle.bundleURL.appendingPathComponent(manifestItem.value.path)
        } else {
            return nil
        }
    }
    
    let strippedSections: [String] = [
        "title",
        "section",
        "cover",
        "colophon",
        "imprint",
        "endnote",
        "copyright"
    ]
    
    return contentFiles
        .filter { url in
            let lastPathComponent = url.deletingPathExtension().lastPathComponent.lowercased()
            for strippedSection in strippedSections {
                if lastPathComponent.contains(strippedSection) {
                    return false
                }
            }
            return true
        }
        .flatMap { url in
            do {
                return try SwiftSoup
                    .parse(String(contentsOf: url, encoding: .utf8))
                    .select("p,h1,h2,h3,h4,h5,h6,pre")
                    .compactMap { try $0.text().trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
            } catch {
                print("XML File not loaded")
                return []
            }
        }
}

func indexFromEPub(document: EPUBDocument) -> [String]? {
    var IDarray: [String] = []
    var CHarray: [String] = []
    
    for item in document.spine.items {
        IDarray.append(item.idref)
    }
    
    for item in document.manifest.items {
        for idref in IDarray {
            if idref == item.value.id {
                CHarray.append(item.value.path)
            }
        }
    }
    return CHarray.isEmpty ? nil : CHarray
}

func stringURLcleaning(path_string : String) -> String? {
    var temp = path_string
    temp.removeFirst()
    temp.removeFirst()
    temp.removeFirst()
    temp.removeFirst()
    temp.removeFirst()
    temp.removeFirst()
    temp.removeFirst()
    
    return temp
}




