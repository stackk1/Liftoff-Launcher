//
//  ContentView.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

struct LauncherView: View {
    @EnvironmentObject var wp: WPService
    @EnvironmentObject var nav: NavigationService
    
    var body: some View {
        let ss = StackServer()
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
        
        VStack{
            NavigationView{
                ZStack {
                    if wp.wallpaper {
                        Image(wp.wallpaperImage)
                            .resizable()
                            .ignoresSafeArea()
                    }
                                        else{
                                            Rectangle()
                                                .ignoresSafeArea()
                                                .foregroundColor(.black)
                                        }
                    
                    VStack(spacing: 0){
                        
                        TabView{
                            VStack {
                                WeatherView()
                                    .frame(width: 360, height: 200)
                                    .cornerRadius(25)
                                    .padding(.bottom)
                                
                                
                                LazyVGrid(columns: columns){
                                    Group{
                                        AppButton(app: CasinoView(), image: "gamecontroller", label: "Games")
                                        AppButton(app: CarListView(), image: "car", label: "Cars")
                                        AppButton(app: BookListView(), image: "book", label: "Books")
                                        AppButton(app: RecipeTabView(), image: "list.bullet.rectangle.portrait.fill", label: "Recipes")
                                        AppButton(app: HomeView(), image: "text.book.closed", label: "Learning")
                                        AppButton(app: MapView(), image: "map.fill", label: "Map")
                                    }
                                    Group{
                                        AppButton(app: (WebClipView(url: ss.tdarr)), image: "flowchart.fill", label: "Tdarr")
                                        AppButton(app: (WebClipView(url: ss.plexDash)), image: "chart.xyaxis.line", label: "Plex Dash")
                                        AppButton(app: (WebClipView(url: ss.requestpage)), image: "arrow.down.message", label: "Requests")
                                        AppButton(app: (WebClipView(url: ss.pihole)), image: "hand.raised", label: "Pihole")
                                        AppButton(app: (WebClipView(url: ss.homebridge)), image: "house.fill", label: "Homebridge")
                                        AppButton(app: (WebClipView(url: ss.main)), image: "macpro.gen3.server", label: "Server")
                                        AppButton(app: (WebClipView(url: ss.storage)), image: "macpro.gen1", label: "Storage")
                                        AppButton(app: (WebClipView(url: ss.FFox)), image: "safari", label: "Browser")
                                        AppButton(app: SettingsMasterView(), image: "gear", label: "Settings")
                                    }
                                }
                                .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                            VStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(ColourService.randomRGB())
                                        .frame(width: 360, height: 100)
                                        .cornerRadius(25)
                                        .padding(.bottom)
                                    HStack(spacing: 15){
                                        Image(systemName: "arrow.down.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 45)
                                        //.padding(.bottom)
                                        VStack(alignment: .leading){
                                            Text("Download")
                                            Text("Clients")
                                        }
                                        .font(.title)
                                        .fontWeight(.bold)
                                        
                                    }
                                    .padding(.bottom)
                                    .foregroundColor(.white)
                                }
                                LazyVGrid(columns: columns){
                                    AppButton(app: (WebClipView(url: ss.sonarr)), image: "lifepreserver", label: "Sonarr")
                                    AppButton(app: (WebClipView(url: ss.radarr)), image: "lifepreserver", label: "Radarr")
                                    AppButton(app: (WebClipView(url: ss.lidarr)), image: "music.note.list", label: "Lidarr")
                                    AppButton(app: (WebClipView(url: ss.readarr)), image: "airpodsmax", label: "Readarr")
                                    AppButton(app: (WebClipView(url: ss.DTv)), image: "tv", label: "Shows")
                                    AppButton(app: (WebClipView(url: ss.DMov)), image: "popcorn", label: "Movies")
                                    AppButton(app: (WebClipView(url: ss.Dmusic)), image: "music.note", label: "Music")
                                    AppButton(app: (WebClipView(url: ss.DGame)), image: "gamecontroller.fill", label: "Games")
                                    AppButton(app: (WebClipView(url: ss.DaBook)), image: "character.book.closed.fill", label: "AudioBooks")
                                    AppButton(app: (WebClipView(url: ss.DeBook)), image: "book.closed.fill", label: "eBooks")
                                }
                                .font(.caption)
                                Spacer()
                            }
                            
                            .padding(.horizontal)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    }
                    
                    
                }
            }
            .navigationBarHidden(true)
            
            Button(
                action:{
                    nav.currentApp = nil
                },
                label:{
                    ZStack{
                        ButtonBackgroundView(color: .black)
                        Image(systemName: "square.circle.fill")
                            .font(.system(size:40))
                            .foregroundColor(.white)
                    }
                }
            )
        }.ignoresSafeArea()
    }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        LauncherView()
            .environmentObject(GameModel())
            .environmentObject(BookModel())
            .environmentObject(RecipeModel())
            .environmentObject(ContentModel())
            .environmentObject(WPService())
            .environmentObject(NavigationService())
    }
}
