import SwiftUI

final class ImageCache {
    static let shared = ImageCache()

    private init() {}

    private var cache = NSCache<NSURL, UIImage>()

    func getImage(forKey key: NSURL) -> UIImage? {
        return cache.object(forKey: key)
    }

    func setImage(_ image: UIImage, forKey key: NSURL) {
        cache.setObject(image, forKey: key)
    }
}
