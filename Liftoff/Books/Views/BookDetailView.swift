
import SwiftUI

struct BookDetailView: View {
    
    
    @EnvironmentObject var model:BookModel
    @Environment(\.presentationMode) var presentationMode
    @State var bookRating = 1
    @State var faveStatus:Bool
    var book: Book
    
    var body: some View {
        
        VStack{
            //MARK: Title and Cover
            Text(book.title)
                .fontWeight(.bold)
                .font(.custom("Avenir Heavy", size: 24))
            
            NavigationLink(
                destination: {
                    ReaderView(book: book)
                },
                label:{
                    Image("cover\(book.id)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 400)
                        .padding(.vertical)
                })
           
            NavigationLink(
                destination: {
                    ReaderView(book: book)
                }, label:{
                    Text("Read Now")
                        .fontWeight(.bold)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(35)
                    
                    
                })

            //Custom back button insert
            //  .navigationBarBackButtonHidden(true)
            //   .navigationBarItems(leading: backButton)
            .padding(.bottom)
            
            
            //MARK: Favourite Button
            Text("Mark as Favourite")
            
            Button(
                action:{
                    //write favourite status back to model
                    model.updateFavourite(forId: book.id)
                    faveStatus = book.isFavourite
                    // Diagnostics
                    print("ID: \(book.id)")
                    print("isFavourite: \(book.isFavourite)")
                    
                },
                label: {
                    Image(systemName: book.isFavourite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 28, height: 28)
                })
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.yellow)
            .padding()
            
            //MARK: Rating Picker
            Text("Rate \(book.title)")
            Picker("",selection: $bookRating){
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }
            .padding(.horizontal)
            .pickerStyle(SegmentedPickerStyle())
            //write rating back to model
            .onChange(of: bookRating) { newValue in
                model.updateRating(forId: book.id, rating: bookRating)
                print("bookRating: \(bookRating)")
                print("rating: \(book.rating)")
            }
            Spacer()
        }
        //.navigationTitle(book.title)
        .padding()
        .onAppear(perform: {bookRating = book.rating})
        
    }
    //custom back button experiment
//    var backButton: some View {
//        Button(action: {
//            presentationMode.wrappedValue.dismiss()
//        })
//        {
//            HStack {
//                Image(systemName: "chevron.left")
//                Text("Library")
//            }
//
//        }
//    }
    
    
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        BookDetailView(faveStatus: true, book: Book())
            .environmentObject(BookModel())
    }
}
