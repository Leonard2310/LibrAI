import SwiftUI
import EPUBKit
import SwiftSoup

struct TryView: View {
    var path: URL?
    var document: EPUBDocument?
    
    func textFromePub(document: EPUBDocument) -> String? {
        var array: [String] = []
        var path_array: [String] = []

        for item in document.spine.items {
            array.append(item.idref)
        }

        for item in document.manifest.items {
            for idref in array {
                if idref == item.value.id {
                    path_array.append(item.value.path)
                    do {
                        let html = try String(contentsOf: URL(fileURLWithPath: item.value.path))
                        let doc = try SwiftSoup.parse(html)
                        return try doc.text()
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        return nil
    }



    init() {
        // Inizializza path
        self.path = Bundle.main.url(forResource: "shelley-frankenstein", withExtension: "epub")
        
        // Inizializza document se path non è nil
        if let path = self.path {
            self.document = EPUBDocument(url: path)
        } else {
            print("Impossibile trovare il file ePub.")
        }
    }

    var body: some View {
        if let text = document?.title {
                    Text(text)
                } else {
                    Text("Nessun titolo disponibile")
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
