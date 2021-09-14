//
//  MemoryObjectView.swift
//  MemoryJourney
//
//  Created by Alexander Völz on 04.08.20.
//

import SwiftUI
import MapKit

// shows a single object with it's main image
struct MemoryObjectView: View {
    
    var object: MObject
    
    @State var showCoordinates = false
    @State var isSelected = false

    var body: some View {

        VStack {
            if isSelected {
                Text(object.memoryTitle)
                    .font(.title)
                Text(object.memoryDescription)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .fixedSize()
            }
            if showCoordinates {
                MemoryLocationView(coordinate: object.coordinate)
            }
            ZStack {
                if isSelected {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                        .border(Color.black)
                }
            
                MemoryPicturesView(photos: object.memoryPictures)
            }
        }
        .frame(width: 200, height: 200)
        .gesture(toggleCoordinates)
    }
    
    var toggleCoordinates : some Gesture {
        TapGesture()
        .onEnded() {
            withAnimation {
                showCoordinates.toggle()
            }
        }
    }
}

struct MemoryPicturesView : View {
    var photos: [MPicture]
    let frameSize = CGSize(width: 90, height: 90)
    @State var selectedPhotoID: UUID?

    @State var offset : CGSize = CGSize.zero
    
    var body: some View {
//        Text("BackgroundView")
        backgroundView
            .overlay(
                pictureView(photo: photos[0])
//                ZStack {
//                ForEach(photos.count ..< photos.count) { count in
//                        pictureView(photo: photos[count])
//                            .offset(CGSize(x: offset.width + 5 * count,
//                                           y: offset.height + 10 * count))
//                    }
//                }
            )
    }

    @State var longPressDetected = false

    var backgroundView : some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .fill(Color.gray)
            .frame(width: frameSize.width, height: frameSize.height)
            .aspectRatio(2/3, contentMode: .fill)
            .opacity(0.3)
    }
    
    var scaleEffect : CGFloat { longPressDetected ? 2.0 : 1.0 }
    
    func pictureView(photo: MPicture) -> some View {
        MemoryPictureView(picture: photo)
            .opacity(0.5)
            .optionalFrame(selectedPhotoID == photo.id)
            .offset(offset)
            .scaleEffect(scaleEffect)
            .animation(.default, value: scaleEffect)
            .onTapGesture {
                selectedPhotoID = photo.id
                longPressDetected = false
            }
            .onLongPressGesture() {
                longPressDetected = true
            }
    }
}


struct MemoryPictureView : View {
    var picture: MPicture
    
    var colors : [Color] = [ .blue, .green, .red, .yellow, .orange ]
    let frameSize = CGSize(width: 200, height: 200)
    var body: some View {
        picture.image
            .resizable()
            .scaledToFit()
        colors.randomElement()!
            .border(Color.secondary)
            .padding(2)
    }
}

struct Frame<Content: View> : View {
    var isVisible: Bool
    var content: () -> Content
    
    init(isVisible: Bool, content: @escaping () -> Content) {
        self.isVisible = isVisible
        self.content = content
    }
    
    var borderColor : Color { isVisible ? Color.accentColor : Color.primary }
    var borderWidth : CGFloat { isVisible ? 5 : 2 }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
                .border(borderColor, width: borderWidth)
            content()
        }
    }
}

extension View {
    func optionalFrame(_ isVisible: Bool) -> some View {
        Frame(isVisible: isVisible) {
            self
        }
    }
}

struct MemoryLocationView : View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
        VStack {
            HStack {
                Text("x:")
                    .fontWeight(.bold)
                Text(coordinate.latitude.description)
            }
            HStack {
                Text("y:")
                    .fontWeight(.bold)
                Text(coordinate.longitude.description)
            }
        }
    }
}

struct MemoryObjectView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryObjectView(object: .theHouse)
    }
}
