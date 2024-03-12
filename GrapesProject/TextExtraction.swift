import Foundation
import EPUBKit
import SwiftSoup

var path: URL?
var document: EPUBDocument?
var content: [String]?

func loadEPUBDocument(from path: URL?) -> EPUBDocument? {
    guard let path = path else {
        print("Impossibile trovare il file ePub.")
        return nil
    }
    guard let document = EPUBDocument(url: path) else {
        print("Documento EPUB non valido.")
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
        return "Titolo non disponibile"
    }
}

func extractAuthor(document: EPUBDocument?) -> String {
    if document?.author != nil {
        return document!.author!
    }else{
        return "Autore non disponibile"
    }
}

func extractContent(document: EPUBDocument?) -> [String] {
    guard let document = document else {
        print("Documento EPUB non fornito.")
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
