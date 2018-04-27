//
//  Models.swift
//  CollectionView
//
//  Created by José Manuel García Chávez on 4/21/18.
//  Copyright © 2018 Diplomado. All rights reserved.
//

import UIKit

class Category : NSObject{
    var name: String?
    var albums: [Album]?
    
    static func samples() -> [Category]{
        let bestNewAlbums = Category()
        bestNewAlbums.name = "Los mejores"
        
        
        var albums = [Album]()
        
        
        let album = Album()
        album.category = "Rock"
        album.name = "Queen"
        album.image = "Illuminati"
        
        albums.append(album)
        bestNewAlbums.albums = albums
        
        let bestClassicAlbums = Category()
        bestClassicAlbums.name = "Musica Clásica"
        
        var albums2 = [Album]()
        
        let album2 = Album()
        album2.category = "Alternative"
        album2.name = "Keane"
        album2.image = "Illuminati"
        
        albums2.append(album2)
        bestClassicAlbums.albums = albums2
        
        
        return [bestNewAlbums, bestClassicAlbums]
    }
}


class Album: NSObject{
    var name: String?
    var category: String?
    var image: String?
}
