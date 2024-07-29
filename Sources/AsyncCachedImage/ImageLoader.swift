import SwiftUI
import Combine

final public class ImageLoader: ObservableObject {

    @Published public var image: UIImage?
    private var url: URL
    private var cancellable: AnyCancellable?

    public init(url: URL) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        guard let urlKey = NSURL(string: url.absoluteString) else { return }

        if let cachedImage = ImageCache.shared.getImage(forKey: urlKey) {
            self.image = cachedImage
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if let image = $0 {
                    ImageCache.shared.setImage(image, forKey: urlKey)
                }
                self?.image = $0
            }
    }
}

