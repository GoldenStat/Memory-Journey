//
//  MemoryObjectEditor.swift
//  iOS
//
//  Created by Alexander Völz on 03.08.20.
//

import SwiftUI

struct MemoryObjectEditor: View {
    var memory: MObject { didSet {
        title = memory.memoryTitle
        description = memory.memoryDescription
    }}
    
    @State var title: String = ""
    @State var description: String = ""
    
    /// displays one memory that is editable
    var body: some View {
        VStack(spacing: 15) {
            
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            
            MemoryImageWindow(pictures: memory.memoryPictures)
        }
    }
}

struct MemoryImageWindow: View {
    var pictures: [MPicture]
    
    var body: some View {
        ForEach(pictures) { memoryPicture in
            memoryPicture.image
        }
    }
}

struct MemoryObjectEditor_Previews: PreviewProvider {
    static var previews: some View {
        MemoryObjectEditor(memory: MObject.theHouse)
    }
}
