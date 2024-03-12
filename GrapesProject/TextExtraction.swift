import Foundation
import EPUBKit
import SwiftSoup

extension EPUBDocument {
    func textFromePub() -> [String] {
        var contentTexts: [String] = []
        
        // Assuming 'contentFiles' is an array of URLs pointing to the content files
        let contentFiles = self.spine.items.compactMap { item in
            self.manifest.items[item.idref]?.path
        }
        
        for filePath in contentFiles {
            do {
                let html = try String(contentsOfFile: filePath, encoding: .utf8)
                let doc = try SwiftSoup.parse(html)
                let texts = try doc.select("p,h1,h2,h3,h4,h5,h6,pre").compactMap { try $0.text().trimmingCharacters(in: .whitespacesAndNewlines) }
                contentTexts.append(contentsOf: texts)
            } catch {
                print("Error loading file at \(filePath): \(error.localizedDescription)")
            }
        }
        
        return contentTexts
        
        
        
    }
}
