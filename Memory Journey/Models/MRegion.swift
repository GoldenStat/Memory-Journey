//
//  Region.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 09.09.21.
//

import SwiftUI
import MapKit

/// an MRegion is a defined area in an MPlace (defined by locationCoordinates / MPlaceUnits?)
/// it contains MObjects
class MRegion: ObservableObject, Identifiable {
    var id = UUID()
    var name: String
    var path: Path = Path() // points of location coordinates / unit coordinates
    var center: CLLocationCoordinate2D = .saDomo
    var objects: [MObject] = []
    var image: Image? // should this get an image, too? or extract it's image from the MPlace?
    
    init(name: String) {
        self.name = name
    }

}
