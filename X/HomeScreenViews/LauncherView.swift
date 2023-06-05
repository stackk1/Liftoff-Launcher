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
                        ZStack{
                            Rectangle()
                                .frame(width: 300, height: 200)
                                .foregroundColor(RandomColour.colorView())
                                .cornerRadius(25)
                            VStack{
                                Image(systemName: "cloud.sun.rain")
                                    .imageScale(.large)
                                Text("Weather")
                            }
                            
                        }
                        HStack{
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
                                            
                                        }
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
                                        }
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
                                        }
                                    }
                                })
                        }
                        HStack{
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
                                        }
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
                                        }
                                    }
                                })
                            ZStack{
                                HomeButtons()
                                VStack{
                                    Image(systemName: "clock")
                                        .imageScale(.large)
                                    Text("Clock")
                                }
                            }
                        }
                        
                    Spacer()
                    }
                }
                .foregroundColor(.white)
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
