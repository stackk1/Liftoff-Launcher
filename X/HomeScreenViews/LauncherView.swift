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
        let ss = StackServer()
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        VStack{
            NavigationView{
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.black)
                    
                    VStack {
                        WeatherView()
                            .frame(width: 330, height: 200)
                            .cornerRadius(25)
                        
                        LazyVGrid(columns: columns){
                            
                            AppButton(app: CasinoView(), image: "gamecontroller", label: "Games")
                            AppButton(app: CarListView(), image: "car", label: "Cars")
                            AppButton(app: BookListView(), image: "book", label: "Books")
                            AppButton(app: RecipeTabView(), image: "list.bullet.rectangle.portrait.fill", label: "Recipes")
                            AppButton(app: HomeView(), image: "text.book.closed", label: "Learning")
                            AppButton(app: MapView(), image: "map.fill", label: "Map")
                            AppButton(app: AnyView(WebClipView(url: ss.sonarr)), image: "lifepreserver", label: "Sonarr")
                            AppButton(app: AnyView(WebClipView(url: ss.radarr)), image: "lifepreserver", label: "Radarr")
                            AppButton(app: AnyView(WebClipView(url: ss.lidarr)), image: "music.note.list", label: "Lidarr")
                            AppButton(app: AnyView(WebClipView(url: ss.requestpage)), image: "arrow.down.message", label: "Requests")
//                            AppButton(app: AnyView(WebClipView(url: ss.pihole)), image: "hand.raised", label: "Pihole")
//                            AppButton(app: AnyView(WebClipView(url: ss.homebridge)), image: "house.fill", label: "Homebridge")
                            
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        
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
