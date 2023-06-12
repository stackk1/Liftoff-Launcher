//
//  WebClipView.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//

import SwiftUI
import WebKit

struct WebClipView: UIViewRepresentable {
    var url: String
    
        
        //build UIRepresentable
        func makeUIView(context: Context) -> some UIView {
            let webView = WKWebView()
            let trueurl = URL(string: (url))
            //create and load web request
            let request = URLRequest(url: trueurl!)
            webView.load(request)
            return webView                
                }
        func updateUIView(_ uiView: UIViewType, context: Context){
            return
        }
        
    }

struct WebClipView_Previews: PreviewProvider {
    static var previews: some View {
        WebClipView(url: "https://stackk.me")
    }
}
