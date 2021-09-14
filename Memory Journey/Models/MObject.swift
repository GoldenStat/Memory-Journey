//
//  MObject.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 02.08.20.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static var nearDistance = 0.001
    func isNearby(_ location: CLLocationCoordinate2D) -> Bool {
        let latDistance = (latitude - location.latitude)
        let longDistance = (longitude - location.longitude)
        return latDistance * latDistance + longDistance * longDistance <
            CLLocationCoordinate2D.nearDistance * CLLocationCoordinate2D.nearDistance
    }
}

/// the objects we place in one MemoryJourneyGroup (aka "region")
/// they need to have a location (coordinate), a description and several pictures with times and comments
class MObject: NSObject, ObservableObject, Identifiable, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
        
    var id = UUID()
    @Published var memoryPictures: [MPicture] // picture has time, comment, image
    @Published var memoryDescription: String = ""
    @Published var memoryTitle: String = ""
    var image: Image? { memoryPictures.first?.image }

    var title: String? { memoryTitle }
    var subtitle: String? { memoryDescription }
    
    init(id: UUID = UUID(),
         at coordinate: CLLocationCoordinate2D,
         description: String = "",
         title: String = "New Memory",
         memoryPictures: [MPicture] = []) {
        self.id = id
        self.coordinate = coordinate
        self.memoryDescription = description
        self.memoryTitle = title
        self.memoryPictures = memoryPictures
    }
}
