//  Created by Andrew on 2023-05-04.
//
//
import SwiftUI

struct RecipeTabView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        TabView{
            FavouriteView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Favourites")
                        
                    }
                }
            RandomView(randomRecipe: model.randomRecipe(meal: "Dinner"))
                .tabItem{
                    VStack{
                        Image(systemName: "dice")
                        Text("Random")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")}
                    
                }
            AddRecipeView()
                .tabItem{
                    VStack{
                        Image(systemName: "plus")
                        Text("Add New")
                    }
                }
        }
        .accessibilityIdentifier("SCREEN_RECIPES")
        .accessibilityElement(children: .contain)
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .environmentObject(RecipeModel())
        
    }
}
