//
//  MemoryJourneyApp.swift
//  Shared
//
//  Created by Alexander Völz on 02.08.20.
//


import SwiftUI

/// Share Memories
/// Tell a Story
/// ---
/// walk around a place where you have placed objects
/// in an AR world that changed through time.
/// take pictures and add them to the places. Walk around.
/// export movies of your walk, create paths you can virtually move around later in space and time,

/// - *data structures*:  App->[MPlace]->[MRegion]->[MObject]->[MPicture]
///
@main
struct MemoryJourneyApp: App {
    @StateObject var places = Places()
    
    var body: some Scene {
        WindowGroup {
            MapSelectionView(places: places)
                .environmentObject(places)
        }
    }
}
