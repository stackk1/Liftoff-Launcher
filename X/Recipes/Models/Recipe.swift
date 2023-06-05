//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//
import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID? = nil
    var name:String
    var favourite:Bool
    var image:String
    var category:String
   // var servings:Int
    var ingredients:[String]
    var directions:[String]
}
