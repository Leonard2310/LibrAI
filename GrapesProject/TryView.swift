import SwiftUI
import EPUBKit

struct TryView: View {
    var path: URL?
    var document: EPUBDocument?

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
        if let title = document?.title {
                    Text(title)
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
