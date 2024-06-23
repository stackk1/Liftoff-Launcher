
import SwiftUI

struct CarDetailView: View {
    
    var car:Car
    
    @State var currentTab = 1
    
    var body: some View {
        let cornerRad = 15.0
        
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .ignoresSafeArea()
            VStack(spacing: 10){
                // MARK: Image
                TabView{
                    ForEach (0..<car.imagecount, id:\.self) {index in
                        //First images are not numbered
                        if index == 0{
                            Image(car.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(cornerRad)
                        }else{
                            //additional images are numbered
                            Image(car.image + "-\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(cornerRad)
                        }
                    }.aspectRatio(CGSize(width: 16, height: 12),contentMode: .fit)
                        .shadow(radius: 15)
                        .padding(.horizontal)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))

                // MARK: Details
                
                
                VStack(spacing:10) {
                    // Header Buttons
                    HStack{
                        Button(
                            action: {currentTab = 1},
                            label: {
                                Text("Details")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .background(Color.black)
                                    .cornerRadius(cornerRad)
                                
                            })
                        Button(
                            action: {
                                currentTab = 2
                            },
                            label: {
                                Text("Oil")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .background(Color.black)
                                    .cornerRadius(cornerRad)
                                
                            })
                        Button(
                            action: {
                                currentTab = 3
                            },
                            label: {
                                Text("Tires")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .background(Color.black)
                                    .cornerRadius(cornerRad)
                            })
                    }
                    //Details list, updated from header buttons
                    TabView(selection: $currentTab){
                        CarDetailsListView(car: car).tag(1)
                        OilListView(car:car).tag(2)
                        TiresListView(car: car).tag(3)
                    }
                    .cornerRadius(cornerRad)
                }
                .padding(.horizontal)
                .navigationBarTitle(car.Make + " " + car.Model)
                
            }
        }
    }
    
    
}


struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let car = CarModel()
        CarDetailView(car: car.cars[0])
    }
}
