import SwiftUI

struct LibraryView: View {
    var Mydata = sharedData
    @State private var sheetvision = false
    @State var searchText = ""
    @State private var isSearching = false
    @State private var selectedFile: URL?

    var FilteredBooks: [book] {
        guard !searchText.isEmpty else { return Mydata.Books}
        return Mydata.Books.filter{
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                ZStack {
                    NavigationLink(destination: AllBooksView()){
                        Rectangle()
                            .foregroundStyle(Color.clear)
                            
                    }
                    HStack {
                        Text("Your Books")
                            .font(.title)
                            .fontWeight(.semibold)
                        Label("", systemImage: "chevron.right")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .padding(.trailing, 190)
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(FilteredBooks) {
                            Book in
                            VStack{
                                NavigationLink(destination: ImmersiveReadingView()) {
                                    ZStack {
                                        Image(Book.cover)
                                            .resizable()
                                            .frame(width: 115, height: 182)
                                            .clipShape(RoundedRectangle(cornerRadius: 3))
                                        Image("bookBase")
                                            .resizable()
                                            .frame(width: 115, height: 182)
                                            .clipShape(RoundedRectangle(cornerRadius: 3))
                                            .blendMode(/*@START_MENU_TOKEN@*/.plusDarker/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                Text (Book.title)
                                    .font(.footnote)

                            }
                        }
                    }

                }

            }
            .padding(.leading)
            Text ("Least Read")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.trailing, 230.0)
                .padding(.top,20.0)
                .padding(.leading)
            TabView{

                ForEach(Mydata.LastReadBooks) {
                    Book in
                    BookCardView(book: book(title: Book.title,cover: Book.cover,author: Book.author, lastBackground: Book.lastBackground))
                }
                .padding(.bottom, 80.0)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .navigationTitle("Library")
            .toolbar(content: {
                Button("Add", systemImage: "plus"){
                    sheetvision.toggle()
                }
                .fileImporter(
                    isPresented: $sheetvision,
                    allowedContentTypes: [.epub],
                    allowsMultipleSelection: false
                ) { result in
                    do {
                        let fileURL = try result.get().first!
                        print("Importato un file da: \(fileURL)")
                        self.selectedFile = fileURL

                        // Aggiungi il file alla cartella "Books" nella directory dell'app
                        let fileManager = FileManager.default
                        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                        let booksDirectory = documentsDirectory.appendingPathComponent("Books")
                        let destinationURL = booksDirectory.appendingPathComponent(fileURL.lastPathComponent)

                        // Crea la cartella "Books" se non esiste
                        if !fileManager.fileExists(atPath: booksDirectory.path) {
                            try fileManager.createDirectory(at: booksDirectory, withIntermediateDirectories: true, attributes: nil)
                        }

                        // Copia il file nella cartella "Books"
                        if !fileManager.fileExists(atPath: destinationURL.path) {
                            try fileManager.copyItem(at: fileURL, to: destinationURL)
                        }
                    } catch {
                        print("Errore nell'importazione del file: \(error)")
                    }
                }
            }
            )
        }
        .navigationTitle("Library")
        .searchable(text: $searchText, prompt: "Search a book")

    }

}
#Preview {
    LibraryView()
}
