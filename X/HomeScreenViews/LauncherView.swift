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
    @State var currentTab = 1
    var currentApp:String?
    
    
    var body: some View {
        let ss = StackServer()
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            //MARK: - Home Screen
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
                        
                        TabView(selection: $currentTab){
                            VStack {
                                WeatherView()
                                    .frame(width: 360, height: 200)
                                    .cornerRadius(25)
                                    .padding(.bottom)
                                
                               //MARK: - APPS
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
                                        AppButton(app: (WebClipView(url: ss.tdarr).edgesIgnoringSafeArea(.top)), image: "flowchart.fill", label: "Tdarr")
                                        AppButton(app: (WebClipView(url: ss.plexDash).edgesIgnoringSafeArea(.top)), image: "chart.xyaxis.line", label: "Plex Dash")
                                        AppButton(app: (WebClipView(url: ss.requestpage).edgesIgnoringSafeArea(.top)), image: "arrow.down.message", label: "Requests")
                                        AppButton(app: (WebClipView(url: ss.pihole).edgesIgnoringSafeArea(.top)), image: "hand.raised", label: "Pihole")
                                        AppButton(app: (WebClipView(url: ss.homebridge).edgesIgnoringSafeArea(.top)), image: "house.fill", label: "Homebridge")
                                        AppButton(app: (WebClipView(url: ss.main).edgesIgnoringSafeArea(.top)), image: "macpro.gen3.server", label: "Server")
                                        AppButton(app: (WebClipView(url: ss.storage).edgesIgnoringSafeArea(.top)), image: "macpro.gen1", label: "Storage")
                                        AppButton(app: (WebClipView(url: ss.FFox).edgesIgnoringSafeArea(.top)), image: "safari", label: "Browser")
                                        AppButton(app: SettingsMasterView(), image: "gear", label: "Settings")
                                    }
                                }
                                .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .tag(1)
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
                                    AppButton(app: (WebClipView(url: ss.sonarr).edgesIgnoringSafeArea(.top)), image: "lifepreserver", label: "Sonarr")
                                    AppButton(app: (WebClipView(url: ss.radarr).edgesIgnoringSafeArea(.top)), image: "lifepreserver", label: "Radarr")
                                    AppButton(app: (WebClipView(url: ss.lidarr).edgesIgnoringSafeArea(.top)), image: "music.note.list", label: "Lidarr")
                                    AppButton(app: (WebClipView(url: ss.readarr).edgesIgnoringSafeArea(.top)), image: "airpodsmax", label: "Readarr")
                                    AppButton(app: (WebClipView(url: ss.DTv).edgesIgnoringSafeArea(.top)), image: "tv", label: "Shows")
                                    AppButton(app: (WebClipView(url: ss.DMov).edgesIgnoringSafeArea(.top)), image: "popcorn", label: "Movies")
                                    AppButton(app: (WebClipView(url: ss.Dmusic).edgesIgnoringSafeArea(.top)), image: "music.note", label: "Music")
                                    AppButton(app: (WebClipView(url: ss.DGame).edgesIgnoringSafeArea(.top)), image: "gamecontroller.fill", label: "Games")
                                    AppButton(app: (WebClipView(url: ss.DaBook).edgesIgnoringSafeArea(.top)), image: "character.book.closed.fill", label: "AudioBooks")
                                    AppButton(app: (WebClipView(url: ss.DeBook).edgesIgnoringSafeArea(.top)), image: "book.closed.fill", label: "eBooks")
                                }
                                .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .tag(2)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        Spacer()
                    }
                    
                    
                }
            }
            .navigationBarHidden(true)
            //MARK: - Home Button
        VStack{
            Spacer()
            Button(
                action:{
                    nav.currentApp = nil
                    currentTab = 1
                },
                label:{
                    ZStack{
                        //ButtonBackgroundView(color: .black)
                        Image(systemName: "square.circle.fill")
                            .font(.system(size:40))
                            .foregroundColor(.white)
                            .background(Color(.black))
                            .clipShape(Circle())
                    }
                }
            )
            .padding(.bottom)
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
