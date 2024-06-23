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

            VStack{
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
                .cornerRadius(25)
                .shadow(radius: 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.always))
                //MARK: Favourite button (todo: add favourite button logic)
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 50)
                    Spacer()
                    // top 3 ingredient check
                    IngredientCheckView(recipe: model.recipes[recipeIndex])
                }.padding(.horizontal)
            }
            .navigationBarHidden(true)
            .navigationTitle("Favourites")
            .padding(.horizontal)
            .padding(.bottom, 80)
            .accessibilityIdentifier("SCREEN_RECIPES_FAVOURITES")
            .accessibilityElement(children: .contain)
        
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(RecipeModel())
    }
}
