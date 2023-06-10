//
//  MediaPlaybackView.swift
//  X
//
//  Created by Andrew on 2023-06-09.
//

import SwiftUI

struct MediaPlaybackView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(RandomColour.colorView())
            VStack{
                Text("Song Title - Artist")
                HStack{
                    //PlayHead
                    
                }
                HStack(spacing: 30){
                    //Buttons
                    Image(systemName: "backward.end.alt.fill")
                    Image(systemName: "playpause.fill")
                    Image(systemName: "forward.end.alt.fill")
                }
                HStack{
                    //Volume
                
                }
            }
        }
    }
}

struct MediaPlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPlaybackView()
    }
}
