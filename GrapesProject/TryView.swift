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
        self.content = extractContent(document: self.document)
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
