import SwiftUI
import EPUBKit
import SwiftSoup
import OSLog

/*
 
 extension EPUBDocument {
 
 func textFromePub(document: EPUBDocument) -> String? {
     var array: [String] = []
     
     for item in document.spine.items {
         array.append(item.idref)
     }
     
     for item in document.manifest.items {
         for idref in array {
             if idref == item.value.id {
                 do {
                     let html = try String(contentsOfFile: contentFiles, encoding: .utf8)
                     
                     let doc = try SwiftSoup.parse(html)
                     return try doc.text()
                 } catch let error {
                     print(String(item.value.path))
                     print(error.localizedDescription)
                 }
             }
         }
     }
     return nil
 }
 */

struct TryView: View {
    
    
    var path: URL?
    var document: EPUBDocument?
    var content: [String]
//    var contentFiles: [URL]?
    
    
    init() {
        // Initialize path
        self.path = Bundle.main.url(forResource: "shelley-frankenstein", withExtension: "epub")
        
        // Initialize document if path is not nil
        if let path = self.path {
            self.document = EPUBDocument(url: path)
            print(self.document?.contentDirectory.absoluteString ?? "")
        } else {
            print("Impossibile trovare il file ePub.")
        }
        
        self.content = []
        
        var contentFiles: [URL] {
            guard let bundle = Bundle(path: self.document!.contentDirectory.path()) else {
                print("EPUB unresolved.")
                return []
            }
            return self.document!.spine.items.compactMap { item in
                return if let manifestItem = self.document!.manifest.items.first(where: { (_, value) in item.idref == value.id }) {
                    bundle.bundleURL.appendingPathComponent(manifestItem.value.path)
                } else {
                    nil
                }
            }
        }
        
        var content: [String] {
            contentFiles
                .filter {
                    let strippedSections: [String] = [
                        "title",
                        "section",
                        "cover",
                        "colophon",
                        "imprint",
                        "endnote",
                        "copyright"
                    ]
                    let lastPathComponent = $0.deletingPathExtension().lastPathComponent.lowercased()
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
                    }
                    return []
                }
        }
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach (self.content, id:\.self) { string in
                Text(string)
            }
        }
        /*
        if let extractedText = textFromePub(document: (document ?? EPUBDocument(url: self.path!))!) {   Text(extractedText)
        }
        else {

        }
         */
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
