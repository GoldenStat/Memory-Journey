//
//  File.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 13.12.20.
//

import SwiftUI
import MapKit

class Places : ObservableObject {
    @Published var locations : [MPlace] = []
    
    static let SaDomo = MPlace.saDomo
}

class MPlace : ObservableObject, Identifiable {
    var id = UUID()
    var image : Image
    var title: String
    var description: String
    var regions: [MRegion]
    var location: CLLocationCoordinate2D
    
    static let saDomo = MPlace(image: Image.saDomo, title: "Sa Domo", description: "our Home in Sardegna",location: CLLocationCoordinate2D.saDomo)
    
    init(image: Image,
         title: String = "New Place",
         description: String = "No Description",
         regions: [MRegion] = [],
         location: CLLocationCoordinate2D) {
        self.image = image
        self.title = title
        self.description = description
        self.regions = regions
        self.location = location
    }
}

