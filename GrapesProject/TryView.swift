import SwiftUI
import EPUBKit
import SwiftSoup
import OSLog

import SwiftUI
import EPUBKit
import SwiftSoup
import OSLog

struct TryView: View {
    var path: URL?
    var document: EPUBDocument?
    var content: [String]?
    
    init() {
        self.path = Bundle.main.url(forResource: "A_Game_of_Thrones_A_Song_of_Ice_and_Fire_1", withExtension: "epub")
        self.document = loadEPUBDocument(from: self.path)
        self.content = extractContent()
    }
    
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
    
    func extractContent() -> [String] {
        guard let document = self.document else {
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
    
    var body: some View {
        ScrollView {
            ForEach (self.content!, id:\.self) { string in
                Text(string)
            }
        }
    }
}

// Preview
#if DEBUG
struct TryView_Previews: PreviewProvider {
    static var previews: some View {
        TryView()
    }
}
#endif
