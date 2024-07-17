//  Created by Andrew on 2023-05-04.
//
//
import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var background = true
    @Published var backgroundImage = "Cartoon Wood"
    
    
    init(){
        self.recipes = RecipeService.getLocalData()
    }
    
    func randomRecipe(meal:String) -> Recipe {
        let meals = self.recipes.filter {$0.category == meal}
            let recipe = meals[Int.random(in: 0..<meals.count-1)]
            return recipe
            
        
    }
}

//TODO: Add updateFavourite function
