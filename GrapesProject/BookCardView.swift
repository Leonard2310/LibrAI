import SwiftUI

struct BookCardView: View {
    
    var book: book
    
    var body: some View {
        ZStack{
            //Image(Background della view)
            Image (book.lastBackground)
                .resizable()
                //.padding(.top, 5.0)
                .aspectRatio(contentMode: .fill)                
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
                //.padding(.leading, 31.0)
            Rectangle()
                .fill(LinearGradient(colors: [Color.clear, Color.black.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                //.padding(.leading, 31.0)
                
    
            HStack{
                Image(book.cover)
                    .resizable()
                    .frame(width: 90, height: 140)
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
        .padding(.top, 35.0)
    }
}

#Preview {
    BookCardView(book: book(title: "A Game Of Thrones", cover: "GoT-I&F", lastBackground: "GoT_Background"))
}
