

import Foundation

protocol Service {
    static func getData() -> [Book]
}

class NetworkService: Service {
    static func getData() -> [Book] {
        return []
    }
}

class BookService: Service {
    //static allows direct calls no need for instance "()"
    static func getData() -> [Book] {
        //parse json
        
        //get url path
        let pathString = Bundle.main.path(forResource: "BookData", ofType: "json")
        // Check if pathString is != nil, else.. (guard does not execute unless true
        guard pathString != nil else {
            // return a blank list
            return [Book]()
        }
        //creat url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            //create data object
            let data = try Data(contentsOf: url)
            //decode data
            let decoder = JSONDecoder()
            
            do {
                let bookData = try decoder.decode([Book].self, from: data)
                return bookData
                
            }
            // Decode Error
            catch {
                print(error)
            }
        }
        // Data retrival Error
        catch{
            print(error)
        }
        
        return [Book]()
    }
    
}
