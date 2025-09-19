/**

 * __Homework 6__
 * Jim Mittler
 * 18  September 2025

 This program loads some car images and displays them in a 3x3 grid.
 We display a Nissan logo in the background.
 
 _Italic text_
 __Bold text__
 ~~Strikethrough text~~

 */

import SwiftUI

// this view frames the car image for the grid
struct ImageGridItem: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
            .scaledToFill()
            .clipped()
            .aspectRatio(1, contentMode: .fit)  // Enforce a square aspect ratio
            .accessibilityIdentifier("imageGridItem_\(imageName)") // Added identifier
    }
}

/* The background image was pretty big. When I just displayed it
 behind the grid you couldn't see it. So I am shrinking it to tile it */

func smallTiledImage() -> Image {
    // Get the original image from the asset catalog.
    guard let uiImage = UIImage(named: "background") else {
        return Image(systemName: "photo") // Fallback for safety.
    }
    
    // Resize the image to 200x130
    let targetSize = CGSize(width: 200, height: 130) // Set your desired tile size here
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    let newImage = renderer.image { _ in
        uiImage.draw(in: CGRect(origin: .zero, size: targetSize))
    }
    
    // Return the new, smaller image as a SwiftUI Image.
    return Image(uiImage: newImage)
}

struct ContentView: View {
    
    init() {}

    // get our iamge names
    let imageNames = (1...9).map { "c\($0)" }

    // Define the grid layout with 3 flexible columns.
    let columns: [GridItem] = Array(
        repeating: .init(.flexible()),
        count: 3
    )

    var body: some View {
        // Use a ZStack to layer the background and foreground content.
        ZStack {
            // Background image first (tiled)

            smallTiledImage()
                .resizable()
                .resizable(resizingMode: .tile)
                .ignoresSafeArea()
            
            // now our grid in a vstack
            VStack {
                 LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(imageNames, id: \.self) { imageName in
                        ImageGridItem(imageName: imageName)
                    }
                }
                .padding()
                .accessibilityIdentifier("imageGrid") // Added identifier

            }

        }
    }
}

#Preview {
    ContentView()
}
