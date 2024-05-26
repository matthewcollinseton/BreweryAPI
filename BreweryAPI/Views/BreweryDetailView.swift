//
//  BreweryDetailView.swift
//  BreweryAPI
//
//  Created by Collins, Matthew - MC on 24/05/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    
    @State var breweryId: String
    
    // SOME state property of brewery details
    // which will be of type BreweryDetail
    
    var body: some View {
        VStack {
            Text("\(breweryId)")
            // some front end work to nicely show the brewery details
        }
        .onAppear {
            // call some api manager method passing in the brewery id
            // use a completion handler to set the brewery detail of this view
        }
    }
}

#Preview {
    BreweryDetailView(breweryId: "windsor")
}
