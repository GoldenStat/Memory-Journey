//
//  MemoriesMap.swift
//  iOS
//
//  Created by Alexander Völz on 03.08.20.
//

import SwiftUI
import MapKit

/// see your regions on a map
/// replace / select, create new

struct MemoriesMap: View {
    @EnvironmentObject var memories: Memories
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    @State private var region = MKCoordinateRegion(
        center: .saDomo,
        span: .medium
    )
    
    var places: [MPlace] { memories.places }
    var regions : [MRegion] { places.reduce(Array<MRegion>()) { $0 + $1.regions } }
    var objects : [MObject] { regions.reduce(Array<MObject>()) { $0 + $1.objects } }
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: objects) { object in
            MapAnnotation(coordinate: object.coordinate) {
                MemoryObjectView(object: object)
            }
        }
    }
    
//    @Builder func symbol(for object: MObject) -> MapAnnotationProtocol {
//        if let image = object.image {
//            MapAnnotation(coordinate: object.coordinate) {
//                MemoryObjectView(object: object)
//            }
//        } else {
//            MapPin(coordinate: object.coordinate, tint: .blue)
//        }
//
//    }
}

struct MemoriesMap_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesMap()
    }
}
