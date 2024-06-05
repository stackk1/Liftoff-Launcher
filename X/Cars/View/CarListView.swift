
import SwiftUI

struct CarListView: View {
    
    @ObservedObject var model = CarModel()
    
    var body: some View {
        
 
            ScrollView{
                VStack{
                    Text("My Cars")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach(model.cars) { c in
                        NavigationLink(
                            destination: CarDetailView(car: c),
                            label: {
                            CarCardView(c:c)
                        })
                    }
                }
            }
          //  .navigationTitle("Cars")
            .navigationBarHidden(true)
            .accessibilityIdentifier("SCREEN_CARS")
            
        
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
