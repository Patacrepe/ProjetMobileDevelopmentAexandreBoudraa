//
//  DetailRow.swift
//  ProjetBoudraa
//
//  Created by goldorak on 14/02/2022.
//

import SwiftUI

struct DetailRow: View {
    var scheduled: Scheduled
    
    var body: some View {
        HStack {
            
            Text(scheduled.name)

            Spacer()
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(scheduled: scheduledArray[0])
    }
}
