
import SwiftUI

struct CarListView: View {
    
    @ObservedObject var model = CarModel()
    
    var body: some View {
        
 
            ScrollView{
                VStack{
                    ForEach(model.cars) { c in
                        NavigationLink(
                            destination: CarDetailView(car: c),
                            label: {
                            CarCardView(c:c)
                        })
                    }
                }
            }
            .navigationTitle("Cars")
            
        
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
