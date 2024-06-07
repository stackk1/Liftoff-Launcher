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
    @EnvironmentObject var wm: WeatherModel
    @ObservedObject var cs = ColourService()
    @State var currentTab = 1
    @State var inApp = false
    @State var updateButtonColors: Int = 1
    
    var body: some View {
       
        let ss = StackServerPorts()
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            //MARK: - Home Screen
            NavigationView{
                ZStack {
                    if wp.wallpaperImage.caseInsensitiveCompare("Black") != .orderedSame {
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
                            //MARK: - Weather Widget
                            VStack {
//                                Button(action: {
//                                    wm.updateForcast()
//                                    updateButtonColors += 1
                                NavigationLink(
                                    destination: WeatherMainView()
                                        .navigationBarHidden(true),
                                    tag: "Weather",
                                    selection: $nav.currentApp,
                                    label: {
                                    WeatherWidgetView(updateColors: updateButtonColors)
                                        .frame(width: 360, height: 200)
                                        .cornerRadius(25)
                                        .padding(.bottom)
                                    }
                                       )
                                
                                
                               //MARK: - APPS
                                LazyVGrid(columns: columns){
                                    Group{
                                        AppButton(app: CasinoView(), image: "gamecontroller.fill", label: "Games", updateColors: updateButtonColors)
                                        AppButton(app: CarListView(), image: "car.fill", label: "Cars")
                                        AppButton(app: BookListView(), image: "book.fill", label: "Books", updateColors: updateButtonColors)
                                        AppButton(app: RecipeTabView(), image: "list.bullet.rectangle.portrait.fill", label: "Recipes", updateColors: updateButtonColors)
                                        AppButton(app: HomeView(), image: "text.book.closed.fill", label: "Learning", updateColors: updateButtonColors)
                                        AppButton(app: MapView(), image: "map.fill", label: "Map", updateColors: updateButtonColors)
                                    }
                                    Group{
                                        AppButton(app: (WebClipView(url: ss.tdarr).edgesIgnoringSafeArea(.vertical)), image: "flowchart.fill", label: "Tdarr", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.plexDash).edgesIgnoringSafeArea(.vertical)), image: "chart.xyaxis.line", label: "Plex Dash", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.requestpage).edgesIgnoringSafeArea(.vertical)), image: "arrow.down.message.fill", label: "Requests", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.pihole).edgesIgnoringSafeArea(.vertical)), image: "hand.raised.fill", label: "Pihole", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.homebridge).edgesIgnoringSafeArea(.bottom)), image: "house.fill", label: "Homebridge", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.main).edgesIgnoringSafeArea(.vertical)), image: "square.stack.3d.up.fill", label: "Stackk.me", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.storage).edgesIgnoringSafeArea(.vertical)), image: "macpro.gen1.fill", label: "Storage", updateColors: updateButtonColors)
                                        AppButton(app: (WebClipView(url: ss.FFox)), image: "safari.fill", label: "Browser", updateColors: updateButtonColors)
                                        AppButton(app: SettingsMasterView(), image: "gear", label: "Settings", updateColors: updateButtonColors)
                                    }
                                }
                                .onTapGesture {
                                    inApp = true
                                }
                                .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .tag(1)
                            VStack{
//                                ZStack{
//                                    Rectangle()
//                                        .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
//                                        .frame(width: 360, height: 100)
//                                        .cornerRadius(25)
//                                        .padding(.bottom)
//                                    HStack(spacing: 15){
//                                        Image(systemName: "arrow.down.circle.fill")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(height: 45)
//                                        //.padding(.bottom)
//                                        VStack(alignment: .leading){
//                                            Text("Download")
//                                            Text("Clients")
//                                        }
//                                        .font(.title)
//                                        .fontWeight(.bold)
//
//                                    }
//                                    .padding(.bottom)
//                                    .foregroundColor(.white)
//                                }
                                LazyVGrid(columns: columns){
                                    AppButton(app: (WebClipView(url: ss.sonarr).edgesIgnoringSafeArea(.vertical)), image: "lifepreserver", label: "Sonarr")
                                    AppButton(app: (WebClipView(url: ss.radarr).edgesIgnoringSafeArea(.vertical)), image: "lifepreserver", label: "Radarr")
                                    AppButton(app: (WebClipView(url: ss.lidarr).edgesIgnoringSafeArea(.vertical)), image: "music.note.list", label: "Lidarr")
                                    AppButton(app: (WebClipView(url: ss.readarr).edgesIgnoringSafeArea(.vertical)), image: "airpodsmax", label: "Readarr")
                                    AppButton(app: (WebClipView(url: ss.DTv).edgesIgnoringSafeArea(.vertical)), image: "tv.fill", label: "Shows")
                                    AppButton(app: (WebClipView(url: ss.DMov).edgesIgnoringSafeArea(.vertical)), image: "popcorn.fill", label: "Movies")
                                    AppButton(app: (WebClipView(url: ss.Dmusic).edgesIgnoringSafeArea(.vertical)), image: "music.note", label: "Music")
                                    AppButton(app: (WebClipView(url: ss.DGame).edgesIgnoringSafeArea(.vertical)), image: "gamecontroller.fill", label: "Games")
                                    AppButton(app: (WebClipView(url: ss.DaBook).edgesIgnoringSafeArea(.vertical)), image: "character.book.closed.fill", label: "AudioBooks")
                                    AppButton(app: (WebClipView(url: ss.DeBook).edgesIgnoringSafeArea(.vertical)), image: "book.closed.fill", label: "eBooks")
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
            .accessibilityIdentifier("SCREEN_LAUNCH")
            //MARK: - Home Button
        VStack{
            Spacer()
            //HomeButton()
            Button(
                action:{
                    if nav.currentApp != nil {
                        nav.currentApp = nil
                }
                else if currentTab != 1 {
                    currentTab = 1
                }
                    else{
                        updateButtonColors += 1
                    }
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
                .shadow(radius: 9)
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
            .environmentObject(WeatherModel())
            .environmentObject(ColourService())

    }
}
