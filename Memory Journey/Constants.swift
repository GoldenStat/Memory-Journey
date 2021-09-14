//
//  Pictures.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 04.08.20.
//

import SwiftUI
import MapKit

// MARK: - Image constants
extension Image {
    static let figTree = Image("feigenbaum")
    static let sample = Image("beet_rundhaus")
    static let map = Image("saDomo")
    static let saDomo = Image("saDomo")
}

// MARK: - Locations
 
extension CLLocationCoordinate2D {
    
    static let center = CLLocationCoordinate2D(
        latitude: 40.761999,
        longitude: 9.087434
    )
    
    static let saDomo = center
    
    static let oleandro = CLLocationCoordinate2D(
        latitude: center.latitude + 0.0003,
        longitude: center.longitude + 0.00004
    )
    static let roundHouse  = CLLocationCoordinate2D(
        latitude: center.latitude + 0.00001,
        longitude: center.longitude + 0.0004
    )
    static let beet = CLLocationCoordinate2D(
        latitude: center.latitude + 0.0002,
        longitude: center.longitude - 0.0001
    )
    static let figTree = CLLocationCoordinate2D(
        latitude: center.latitude - 0.00001,
        longitude: center.longitude + 0.0006
    )
}

// MARK: - Coordinate Span
extension MKCoordinateSpan {
    static let veryHigh = MKCoordinateSpan(
        latitudeDelta: 0.00001,
        longitudeDelta: 0.00001
    )
    static let high = MKCoordinateSpan(
        latitudeDelta: 0.0001,
        longitudeDelta: 0.0001
    )
    static let medium = MKCoordinateSpan(
        latitudeDelta: 0.001,
        longitudeDelta: 0.001
    )
    static let low = MKCoordinateSpan(
        latitudeDelta: 0.01,
        longitudeDelta: 0.01
    )
    static let veryLow = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1
    )
}


// MARK: - Memory Objects
extension MObject {
    static let theHouse = MObject(at: .saDomo, description: "This is the house in\n'Villa Su Casteddu'.\nThe pictures are\nwhat I have instead\nof the house", title: "La casa", memoryPictures: [
        .figTree,
        .sample,
        .sample,
    ])
    static let figTree = MObject(at: .figTree, description: "This is the acutal\nlittle brave fig tree.\nAs of now, there is\nonly one picture", title: "El Higo", memoryPictures: [
        .figTree,
        .figTree,
        .figTree,
    ])
    static let oleandro = MObject(at: .oleandro, description: "Another Tree on the entrance, an Oleandro", title: "La Subida", memoryPictures: [
        .sample,
        .sample,
        .sample,
    ])
    static let beet = MObject(at: .beet, description: "Das Blumenbeet zum Runden Haus", title: "Das Beet", memoryPictures: [
        .sample,
        .sample,
        .sample,
    ])
}

// MARK: - Memory Pictures
extension MPicture {
    static let sample = MPicture(image: .sample,
                                      date: Date(),
                                      description: "This picture is a placeholder")
    static let figTree = MPicture(image: .figTree,
                                      date: Date(),
                                      description: "A little fig tree, small but brave")
}
