import SwiftUI

struct BookCardView: View {
    
    var book: book
    
    var body: some View {
        ZStack{
            //Image(Background della view)
            Image (book.lastBackground)
                .resizable()
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                //.padding(.leading, 31.0)
            Rectangle()
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                //.padding(.leading, 31.0)
                .opacity(0.6)
            HStack{
                Image(book.cover)
                    .resizable()
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack{
                    Text("Da decidere")
                        .foregroundColor(Color.white)
                        .padding(.leading, 30.0)
                    Text("Da decidere")
                        .foregroundColor(Color.white)
                        .padding(.leading, 30.0)
                    Text("Da decidere")
                        .foregroundColor(Color.white)
                        .padding(.leading, 30.0)
                    
                }
            }
            }
        
    }
}

#Preview {
    BookCardView(book: book(title: "A Game Of Thrones", cover: "GoT-I&F", lastBackground: "GoT_Background"))
}
