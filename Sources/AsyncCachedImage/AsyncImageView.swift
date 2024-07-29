import SwiftUI

public struct AsyncCachedImage: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Image

    public init(url: String, placeholder: Image = Image(systemName: "placeholdertext.fill")) {
        let url = URL(string: url)
        _loader = StateObject(wrappedValue: ImageLoader(url: url!))
        self.placeholder = placeholder
    }

    public var body: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            placeholder
                .resizable()
        }
    }
}
