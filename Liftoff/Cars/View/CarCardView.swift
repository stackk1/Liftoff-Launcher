
import SwiftUI

struct CarCardView: View {
    var car: Car
    // Car images and names for list view
    var body: some View {
        ZStack{
            //MARK: Image
            Image(car.image)
                .resizable()
                .aspectRatio(CGSize(width:4, height: 3), contentMode: .fill)
                .cornerRadius(20)
                .imageScale(.large)
                .padding()
            //MARK: name & model year
            VStack{
                Text(car.Model)
                    .font(.title)
                    .foregroundColor(Color.white)
                Text(String(car.Year))
                    .font(.subheadline)
                    .foregroundColor(Color.white)
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8)).cornerRadius(10)
        }
        .accessibilityIdentifier("CARCARD_\(car.Model.uppercased() + "_" + String(car.Year))")
    }
}

struct CarCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = CarModel()
        CarCardView(car:model.cars[0])
    }
}
