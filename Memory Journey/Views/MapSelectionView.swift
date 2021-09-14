//
//  MapSelectionView.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 13.12.20.
//

import SwiftUI

/// a list of the available places
struct MapSelectionView: View {
    var places: Places = Places()
    
    var body: some View {
        NavigationView {
            List(places.locations) { place in
                NavigationLink(destination:
                    PlaceObjectView(place: place)) {
                    Text(place.title)
                }
            }
            .navigationBarTitle("Map Selection")
        }
    }
}

struct MapSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MapSelectionView()
    }
}
