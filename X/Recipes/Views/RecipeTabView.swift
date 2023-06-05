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
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")}
                    
                }
            //pass default random category to initialize view
            RandomView(randomRecipe: model.randomRecipe(meal: "Dinner"))
                .tabItem{
                    VStack{
                        Image(systemName: "dice")
                        Text("Random")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .environmentObject(RecipeModel())
        
    }
}
