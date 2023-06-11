//
//  WebClipView.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//

import SwiftUI
import WebKit

struct WebClipView: UIViewRepresentable {
        
        let url = URL(string: ("https://stackk.me"))
        
        //build UIRepresentable
        func makeUIView(context: Context) -> some UIView {
            let webView = WKWebView()
            
            //create and load web request
            let request = URLRequest(url: url!)
            webView.load(request)
            return webView
        }
        func updateUIView(_ uiView: UIViewType, context: Context){
            return
        }
    }

struct WebClipView_Previews: PreviewProvider {
    static var previews: some View {
        WebClipView()
    }
}
