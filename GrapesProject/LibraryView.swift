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
                NavigationLink(destination: AllBooksView()){
                    Text("Your Books")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Label("", systemImage: "chevron.right")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(FilteredBooks) {
                            Book in
                            VStack{
                                NavigationLink(destination: ImmersiveReadingView()) {
                                    Image (Book.cover)
                                        .resizable()
                                    //.aspectRatio(contentMode: .fit)
                                        .frame(width: 115, height: 182)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
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
                .fontWeight(.bold)
                .padding(.trailing, 230.0)
                .padding(.top,20.0)
                .padding(.leading)
            TabView{

                ForEach(Mydata.Books) {
                    Book in
                    BookCardView(book: book(title: Book.title,cover: Book.cover,lastBackground: Book.lastBackground))
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
                        // Qui puoi gestire il file importato
                        print("Importato un file da: \(fileURL)")
                        self.selectedFile = fileURL
                    } catch {
                        // Gestisci l'errore
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
