
import Foundation

class BookModel:ObservableObject {
    
    @Published var books = [Book]()
    @Published var pageView = true
    @Published var allContent = ""
    @Published var bookRating = 2
    
    
    init(){
        self.books = BookService.getData()
    }
    
    // update books favourite status
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    // compile all pages into one for scroll view
    func compilePages(forId: Int) -> String {
        // loop through pages
        
        for index in 0..<books[forId].content.count {
            allContent += books[forId].content[index]
        }
        return allContent
    }
    //update book rating
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
            
        }
    }
    //save last page viewed
    func updatePage(forId: Int, page: Int){
        if let index = books.firstIndex(where: { $0.id == forId})
        {
            books[index].currentPage = page
        }
    }
}
