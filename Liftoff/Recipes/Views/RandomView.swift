//  Created by Andrew on 2023-05-04.
//
//

import SwiftUI

struct RandomView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var randomRecipe: Recipe
    @State var meal = "Dinner"
    
    var body: some View {
        let bg = model.background
        
        ZStack{
            if bg {
                Image(model.backgroundImage)
                    .resizable()
                    .ignoresSafeArea(edges: .top)
            }
            
            VStack(alignment: .center, spacing: 0) {
               
                //Image
                NavigationLink(
                    destination: RecipeDetailView(recipe: randomRecipe),
                    label: {
                        RecipeCardView(recipe: randomRecipe)
                            .cornerRadius(25)
                            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.6), radius: 10, x:-5, y:5)
                    })
                //MARK: Random Button and Ingredients check
                HStack{
                    // Random button
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.5))
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)
                        VStack(alignment: .center, spacing: 10){
                            Button(
                                action: {
                                    randomRecipe = model.randomRecipe(meal:meal)
                                },
                                label: {
                                    Image(systemName: "dice.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                            Text("Pick for Me")
                                .font(.caption)
                                .fontWeight(.bold)
                        }.foregroundColor(.white)
                    }
                    Spacer()
                    IngredientCheckView(recipe: randomRecipe)
                }.padding()
                Text("What would you like for:")
                    .fontWeight(.bold)
                    .padding(.leading)
                //Select meal category
                Picker("What's for ", selection: $meal){
                    Text("Dinner").tag("Dinner")
                    Text("Breakfast").tag("Breakfast")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
            }
            .navigationTitle("Meal Picker")
            .padding(.horizontal)
            .onAppear(perform: {randomRecipe = model.randomRecipe(meal: "Dinner")})
            .padding(.bottom, 80)
        }
        .foregroundColor(bg == true ? .white : .black)
    }
}


struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RandomView(randomRecipe: model.randomRecipe(meal: "Dinner"), meal: "Dinner")
            .environmentObject(RecipeModel())
    }
}
