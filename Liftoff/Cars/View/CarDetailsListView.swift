//
//  DetailsListView.swift
//  Cars
//
//  Created by Andrew on 2023-06-04.
//

import SwiftUI

struct CarDetailsListView: View {
    @AppStorage("Milage") private var milageField: String = ""
    
    var car: Car
    var body: some View {
        List{
            
            HStack {
                Text("Make:")
                    .fontWeight(.bold)
                Text(car.Make)
                    .accessibilityIdentifier("CAR_CURRENT_MAKE_VALUE")
            }
            HStack{
                Text("Model:")
                    .fontWeight(.bold)
                Text(car.Model)
                    .accessibilityIdentifier("CAR_CURRENT_MODEL_VALUE")
            }
            HStack{
                Text("Year:")
                    .fontWeight(.bold)
                Text(String(car.Year))
                    .accessibilityIdentifier("CAR_CURRENT_YEAR_VALUE")
            }
            HStack{
                Text("Colour:")
                    .fontWeight(.bold)
                Text(car.Colour)
                Text("CODE")
            }
            HStack{
                Text("Engine:")
                    .fontWeight(.bold)
                Text(car.Engine)
            }
            HStack{
                Text("Total Milage:")
                    .fontWeight(.bold)
                TextField("Enter Milage", text: $milageField)
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct OilListView: View {
    @AppStorage("Last Change") private var lastOilChangeField: String = ""
    @AppStorage("Next Change") private var nextOilChangeField: String = ""

    var car: Car
    var body: some View {
        List{
            HStack{
                Text("Last Change:")
                    .fontWeight(.bold)
                TextField("Enter Milage", text: $lastOilChangeField)
            }
            HStack{
                Text("Next Change:")
                    .fontWeight(.bold)
                TextField("Enter Milage", text: $nextOilChangeField)
            }
            HStack{
                Text("Oil Type:")
                    .fontWeight(.bold)
                Text("Mobile 1 Sythetic")
            }
            HStack{
                Text("Oil Weight:")
                    .fontWeight(.bold)
                Text("5W")
            }
            HStack{
                Text("Oil Viscosity:")
                    .fontWeight(.bold)
                Text("30")
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct TiresListView: View {
    @AppStorage("Tire Milage") private var tireLastChangeField: String = ""
    var car: Car
    var body: some View {
        List{
            HStack{
                Text("Last Change:")
                    .fontWeight(.bold)
                TextField("Enter Milage", text: $tireLastChangeField)
            }
            HStack{
                Text("Warranty Expiry:")
                    .fontWeight(.bold)
                Text("XXXXX KMS")
            }
            HStack{
                Text("Tires Brand:")
                    .fontWeight(.bold)
                Text("Toyo")
            }
            HStack{
                Text("Tire Model:")
                    .fontWeight(.bold)
                Text("Open Country A/T III")
            }
            HStack{
                Text("Prefered PSI:")
                    .fontWeight(.bold)
                Text("Front: 35, Rear: 35")
            }
            HStack{
                Text("Lugnut Torque:")
                    .fontWeight(.bold)
                Text("110 Nm")
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct DetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        let car = CarModel()
        CarDetailsListView(car: car.cars[0])
        OilListView(car: car.cars[0])
        TiresListView(car: car.cars[0])
    }
}
