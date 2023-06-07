//
//  SwiftUIView.swift
//  X
//
//  Created by Andrew on 2023-06-07.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Self.Context) -> MKMapView{
        //create and configure map element
        let mapView = MKMapView()
        return mapView
    }
    //update element if needed
    func updateUIView(
        _ uiView: MKMapView,
        context: Self.Context
    ){
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
