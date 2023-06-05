///
//  ContentView.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

struct LauncherView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationView{
                VStack{
                    NavigationLink(
                        destination:
                            CasinoView()
                            //.environmentObject(GameModel())
                        ,
                        label: {
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Games")
                        })
                    NavigationLink(
                        destination:
                            CarListView(),
                        label: {
                            Image(systemName: "car")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Cars")
                        })
                    NavigationLink(
                        destination:
                            BookListView()
                           // .environmentObject(BookModel())
                        ,
                        label: {
                            Image(systemName: "book")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Books")
                        })
                    NavigationLink(
                        destination:
                            RecipeTabView()
                            //.environmentObject(RecipeModel())
                        ,
                        label: {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Recipes")
                        })
                    NavigationLink(
                        destination:
                            HomeView()
                            //.environmentObject(ContentModel())
                        ,
                        label: {
                            Image(systemName: "text.book.closed")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Learning")
                        })
                }
            }
        }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
