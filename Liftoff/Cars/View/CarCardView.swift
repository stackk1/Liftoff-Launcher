
import SwiftUI

struct CarCardView: View {
    var c: Car
    // Car images and names for list view
    var body: some View {
        ZStack{
            //MARK: Image
            Image(c.image)
                .resizable()
                .aspectRatio(CGSize(width:4, height: 3), contentMode: .fill)
                .cornerRadius(20)
                .imageScale(.large)
                .padding()
            //MARK: name & model year
            VStack{
                Text(c.Model)
                    .font(.title)
                    .foregroundColor(Color.white)
                Text(String(c.Year))
                    .font(.subheadline)
                    .foregroundColor(Color.white)
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8)).cornerRadius(10)
        }
    }
}

struct CarCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = CarModel()
        CarCardView(c:model.cars[0])
    }
}
