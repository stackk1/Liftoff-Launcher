//
//  ContentView.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

struct LauncherView: View {
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    NavigationLink(
                        destination:
                            CasinoView(),
                        label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(RandomColour.colorView())
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                VStack{
                                    Image(systemName: "globe")
                                        .imageScale(.large)
                                        
                                    Text("Games")
                                    
                                }.foregroundColor(.white)
                            }
                        })
                    NavigationLink(
                        destination:
                            CarListView(),
                        label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(RandomColour.colorView())
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                VStack{
                                    Image(systemName: "car")
                                        .imageScale(.large)
                                        
                                    Text("Cars")
                                }.foregroundColor(.white)
                            }
                        })
                    NavigationLink(
                        destination:
                            BookListView(),
                        label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(RandomColour.colorView())
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                VStack{
                                    Image(systemName: "book")
                                        .imageScale(.large)
                                        
                                    Text("Books")
                                }.foregroundColor(.white)
                            }
                        })
                    NavigationLink(
                        destination:
                            RecipeTabView(),
                        label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(RandomColour.colorView())
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                VStack{
                                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                                        .imageScale(.large)
                                        
                                    Text("Recipes")
                                }.foregroundColor(.white)
                            }
                        })
                    NavigationLink(
                        destination:
                            HomeView(),
                        label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(RandomColour.colorView())
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                VStack{
                                    Image(systemName: "text.book.closed")
                                        .imageScale(.large)
                                        
                                    Text("Learning")
                                }.foregroundColor(.white)
                            }
                        })
                }
            }
        }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameModel())
            .environmentObject(BookModel())
            .environmentObject(RecipeModel())
            .environmentObject(ContentModel())
    }
}
