//  Created by Andrew on 2023-05-04.
//
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var recipeIndex = 0
    
    var body: some View {
        //create array of only favourite recipes
        let favourites = model.recipes.filter {$0.favourite == true}
        let bg = model.background
        
        ZStack{
            if bg {
                Image(model.backgroundImage)
                    .resizable()
                    .ignoresSafeArea(edges: .top)
            }
            VStack(){
                //Recipe cards
                TabView(selection: $recipeIndex) {
                    ForEach(0..<favourites.count, id:\.self) { index in
                        NavigationLink(
                            destination: RecipeDetailView(recipe: model.recipes[index]),
                            label: {
                                RecipeCardView(recipe: model.recipes[index])
                            })
                        .tag(index)
                    }
                }
                .padding(.vertical)
                .cornerRadius(25)
                .shadow(radius: 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.never))
                //MARK: Favourite button (todo: add favourite button logic)
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                    Spacer()
                    // top 3 ingredient check
                    IngredientCheckView(recipe: model.recipes[recipeIndex])
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .navigationTitle("Favourites")
            .padding(.horizontal)
            .padding(.bottom, 50)
            .accessibilityIdentifier("SCREEN_RECIPES_FAVOURITES")
            .accessibilityElement(children: .contain)
        }
        .foregroundColor(bg == true ? .white : .black)
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(RecipeModel())
    }
}
