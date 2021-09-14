//
//  Path.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 02.08.20.
//

import Foundation

/// sequence or set of objects
struct MemoryPath: Identifiable {
    var id = UUID()
    var objects: [MObject]
}
