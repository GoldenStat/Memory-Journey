//
//  MemoryPicture.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 02.08.20.
//

import SwiftUI

/// the single events we want to memorize
/// e.g. a picture of a plant at a point in time with a decription of ongoing events around this time (e.g. "started watering 2x per day", "added 1/2 kg fertilizer", "potted")
struct MPicture: Identifiable {

    var id = UUID()
    var image: Image
    var date: Date // from when is the picture? (use picture date by default, but make it changeable)
    var description: String // more descriptive text, especifically for this picture

    var scale: Double = 1.0
}
