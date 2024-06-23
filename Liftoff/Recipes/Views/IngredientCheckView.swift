//
//  IngredientCheckView.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//
import SwiftUI

struct IngredientCheckView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .trailing){
            Text("Ingredients to Check").font(.headline)
           //get first ingredient
            Text(recipe.ingredients[0])
            //check for 2nd and 3rd ingredients
            if (recipe.ingredients.count > 1) { Text(recipe.ingredients[1])
            }
            if (recipe.ingredients.count > 2) { Text(recipe.ingredients[2])
            }
        }
        .frame(height: 75)
        //cut text off instead of wrapping
        .truncationMode(.tail)
    }
}

struct IngredientCheckView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        IngredientCheckView(recipe: model.recipes[7])
    }
}
