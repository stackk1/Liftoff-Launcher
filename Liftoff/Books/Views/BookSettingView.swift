

import SwiftUI

struct BookSettingView: View {
    @EnvironmentObject var model:BookModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Current View:")
                    .fontWeight(.bold)
                if model.pageView {
                    Text("Page View")
                }else {
                    Text ("Scroll View")
                }
            }
            // Change Page View
            Toggle(
                isOn: $model.pageView,
                label: {Text("Page View")
                })
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Settings")
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        BookSettingView()
            .environmentObject(BookModel())
        
    }
}
