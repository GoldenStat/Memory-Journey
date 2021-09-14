//
//  RegionView.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 04.08.20.
//

import SwiftUI

/// here we see all the pictures of all the objects in this region
struct RegionView: View {
    @ObservedObject var region: MRegion
    
    var body: some View {
        VStack {
            Text(region.name)
            List(region.objects) { object in
                HStack {
                    ForEach(object.memoryPictures) { picture in
                        picture.image
                    }
                }
            }
        }
    }
}

struct MemoryJourneyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView(region: MRegion(name: "Sample"))
    }
}
