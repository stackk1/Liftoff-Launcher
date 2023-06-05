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
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(.black)
                    VStack{
                        NavigationLink(
                            destination:
                                CasinoView(),
                            label: {
                                ZStack{
                                    HomeButtons()
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
                                    HomeButtons()
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
                                    HomeButtons()
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
                                    HomeButtons()
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
                                    HomeButtons()
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
