# AsyncCachedImage
<br>In SwiftUI we have AsyncImage, using this API we can load image from URL, but it has one disadvantage, it is not caching images, it just loads, it means if you want to cache images you need to do some extra implemtations. Using AsyncCachedImage you can easily cache for image and show it, you need to write just one line code.</br>
<br><b>Minimum iOS version: 15</b></br>
# Usage
```swift
import SwiftUI
import AsyncCachedImage

struct ContentView: View {
    var body: some View {
       AsyncCachedImage(url: "ImageURL")
            .frame(maxHeight: 200)
            .aspectRatio(1.0, contentMode: .fit)
    }
}
```

# Installation
AsyncCachedImage is available via [Swift Package Manager](https://www.swift.org/documentation/package-manager/).

Using Xcode 15, go to File -> Swift Packages -> Add Package Dependency and enter [https://github.com/Tiko94/AsyncCachedImage](https://github.com/Tiko94/AsyncCachedImage)
