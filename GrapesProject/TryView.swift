import SwiftUI
import EPUBKit
import SwiftSoup

struct TryView: View {
    var path: URL?
    var document: EPUBDocument?
    
    func textFromePub(document: EPUBDocument) -> String? {
        var array: [String] = []

        for item in document.spine.items {
            array.append(item.idref)
        }
        
        for item in document.manifest.items {
            for idref in array {
                if idref == item.value.id {
                    do {
                        let html = try String(contentsOf: URL(fileURLWithPath: item.value.path))
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
    
    init() {
        // Initialize path
        self.path = Bundle.main.url(forResource: "shelley-frankenstein", withExtension: "epub")
        
        // Initialize document if path is not nil
        if let path = self.path {
            self.document = EPUBDocument(url: path)
        } else {
            print("Impossibile trovare il file ePub.")
        }
    }
    
    var body: some View {
        if let extractedText = textFromePub(document: (document ?? EPUBDocument(url: self.path!))!) {   Text(extractedText)
        }
        else {
            Text("Nessun testo disponibile")
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
