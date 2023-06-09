//
//  ContentView.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

struct LauncherView: View {
    @State var colorMode = true
    var body: some View {
        
        VStack{
            NavigationView{
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.black)
                    VStack(alignment: .center){
                        ZStack{
                            Rectangle()
                                .frame(width: 350, height: 200)
                                .foregroundColor(RandomColour.colorView())
                                .cornerRadius(25)
                            VStack{
                                Image(systemName: "cloud.sun.rain")
                                    .imageScale(.large)
                                Text("Weather")
                            }
                            
                        }
                        HStack(spacing: 30){
                            NavigationLink(
                                destination:
                                    CasinoView(),
                                label: {
                                    ZStack{
                                        HomeButtons()
                                        VStack{
                                            Image(systemName: "gamecontroller")
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
                        HStack(spacing: 30){
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
                            
                                Button(
                                    // Use clock place holder as secret button to refresh display
                                    action:{
                                        colorMode.toggle()
                                        print(colorMode)
                                    },
                                    label:{
                                        ZStack{
                                        HomeButtons()
                                        VStack{
                                            Image(systemName: "clock")
                                                .imageScale(.large)
                                            Text("Clock")
                                        }
                                    }
                            })
                        }
                        MapView()
                            .frame(width: 350, height: 250)
                            .cornerRadius(25)
                        
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
