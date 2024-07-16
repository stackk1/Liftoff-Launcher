
import SwiftUI

struct ReaderView: View {
    @EnvironmentObject var model:BookModel
    @Environment(\.presentationMode) var presentationMode
    @State var lastPage = 0
    
    var book:Book
    
    var body: some View {
        //Check if Page or Scroll View is prefered
        if model.pageView {
            //Page View
            
            TabView(
                selection: $lastPage
            ){
                ForEach (Array(book.content.enumerated()), id:\.element) { index, content in
                    VStack{
                        Text(content).accessibilityIdentifier("SCREEN_BOOK_READER")
                        Spacer()
                        Text(String(index+1)).accessibilityIdentifier("BOOK_PAGE_NUMBER")
                    }
                    .tag(index)
                    .padding()
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: backButton)
                    
                }
            }
            //Save Current Page
            .onChange(of: lastPage) { newPage in
                model.updatePage(forId: book.id, page: newPage)
                // Diagnostic Outputs
                
                //                print ("page change")
                //                print ("__________")
                //                print ("Model Data: \(book.currentPage)")
                //                print ("newPage: \(newPage)")
                //                print ("lastPage: \(lastPage)")
                //                print ("__________")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
               
        }
        else{
            //Continuous Scroll
            ScrollView{
                Text(model.allContent).padding()
            }
            .onAppear(perform: {model.allContent = model.compilePages(forId: book.id)})
            //            .navigationBarHidden(false)
            //            .navigationBarBackButtonHidden(true)
            //            .navigationBarItems(leading: backButton)
            
        }
    }
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Image("cover\(book.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(book.title)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}

struct ReaderView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        ReaderView(book:model.books[0])
            .environmentObject(BookModel())
    }
}


