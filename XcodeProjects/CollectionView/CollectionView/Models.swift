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
    
    
    static func SaveService(){
        var components = URL(string: "http://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres")
        
        var req = URLRequest(url: components!)
        req.httpMethod = "GET"
       // req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: req, completionHandler: {(data, response, error) in
            guard error == nil else {
            print("ERROR: \(error!)")
            return
            }
        guard let unwrappedData = data else {
            print("Empty response")
            return
        }
        
        let resp = response as! HTTPURLResponse
            
            
        if resp.statusCode == 200 {
            print (unwrappedData)
            /*do {
               // let parsedJson = try JSONDecoder().decode(User.self, from: unwrappedData)
                //completion(parsedJson)
            } catch let err {
                print("Unable to parse JSON: \(err)")
            }*/
        } else {
            print("Unsuccesful request: \(resp)")
        }})
        task.resume()
    }
}





class Album: NSObject{
    var name: String?
    var category: String?
    var image: String?
}