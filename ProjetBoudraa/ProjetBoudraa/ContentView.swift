import Foundation
import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(scheduledArray, id: \.name) { scheduled in
                NavigationLink(destination: DetailView(scheduled: scheduled)) {
                    DetailRow(scheduled: scheduled)
                }
            }
            .navigationTitle("Scheduled")
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




