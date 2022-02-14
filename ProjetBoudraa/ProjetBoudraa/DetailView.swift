//
//  DetailView.swift
//  ProjetBoudraa
//
//  Created by goldorak on 14/02/2022.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var scheduled: Scheduled
    
    var body: some View {
        VStack {
            VStack {
                
                Text(scheduled.name)
                    .font(.title2)
                    .padding()
                ScrollView {
                    Text(scheduled.description)
                }
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scheduled: Scheduled(name: "Vietnam", description: "blahblahblah"))
    }
}
