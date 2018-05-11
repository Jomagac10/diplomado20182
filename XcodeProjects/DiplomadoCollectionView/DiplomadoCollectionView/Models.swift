
import UIKit

class Service {
    static var Categories : [Category]
}

class Category: NSObject{
    var name: String?
    var albums: [Album]?

    static func samples() -> [Category]{
        
        let bestNewAlbums = Category()
        bestNewAlbums.name = "Los mejores"
        
        var albums1 = [Album]()
        
        let album = Album()
        album.category = "Rock"
        album.name = "Queen"
        album.image = "cover1"
        albums1.append(album)
        
        bestNewAlbums.albums = albums1
        
        let bestClassicAlbums = Category()
        bestClassicAlbums.name = "Música Clásica"
        
        var albums2 = [Album]()
        let album2 = Album()
        album2.category = "Rockcito"
        album2.name = "Queen"
        album2.image = "cover1"
        albums2.append(album2)
        
        bestClassicAlbums.albums = albums2
        
        albums1.append(album2)
        bestNewAlbums.albums = albums1
        
        return [bestNewAlbums, bestClassicAlbums]
    }
}

class Album: NSObject{
    var name: String?
    var category: String?
    var image: String?
}
