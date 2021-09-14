//
//  PlaceView.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 13.12.20.
//

import SwiftUI

/// the photo of this place.
/// in a place you can define regions and in the regions you can place objects
/// e.g.:
/// * place: Main House in Sardegna.
/// * region: behind the house - a description of the location (aka: MemoryJourneyGroup)
/// * object: Lemon Tree
/// * event: planting (foto, time, description)
///
struct PlaceObjectView: View {
    
    @ObservedObject var place: MPlace
    
    var body: some View {
        VStack {
            
            Text(place.title)
            
            place.image
                .resizable()
                .scaledToFit()
                .overlay(
                    ZStack {
                    ForEach(place.regions) { object in
                        RegionView(region: object)
                    }
                }
                )
            Text(place.description)
            Spacer()
        }
    }
    
    // onZoom: Zoom picture
    // onDrag: drag Image
    // onLongPress: start a path and add to object
    // onTap: select a path
    // onDoubleTap: (select path -> zoom in)

    
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceObjectView(place: MPlace.saDomo)
    }
}
