//
//  StoreCollectionViewController.swift
//  DiplomadoCollectionView
//
//  Created by Germán Santos Jaimes on 4/21/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class StoreCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    var albumCategories: [Category]?
    
    //MARK: Agregamos el controlador para buscar
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.backgroundColor = UIColor.white
        albumCategories = Category.samples()

        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        let url = "https://itunes.apple.com/search?term=\(searchText)"

// PARTE 9 - 7
//        let url = "https://itunes.apple.com/search"
//        let parameters = ["term": searchText]
//
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
//            if let err = dataResponse.error{
//                print("Error al obtener datos", err)
//                return
//            }
//
//            guard let data = dataResponse.data else { return }
//            let testString = String(data: data, encoding: .utf8)
//            //print(testString ?? "")
//
//            //Parte 9 - 3
//            do{
//                //Parte 9 - 2
//                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
//                print("Result count:", searchResult.resultCount )
//
//                //Parte 9 - 5
//                searchResult.results.forEach({ (tracks) in
//                    print(tracks.artistName, tracks.trackName)
//                })
//            }catch let decodeErr{
//                print("Error al decodificar", decodeErr)
//            }
//
//        }
        
        Alamofire.request(url).responseData { (dataResponse) in
            if let err = dataResponse.error{
                print("Error al obtener datos", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            let testString = String(data: data, encoding: .utf8)
            //print(testString ?? "")
            
            //Parte 9 - 3
            do{
                //Parte 9 - 2
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                //print("Result count:", searchResult.resultCount )
                
                //Parte 9 - 5
                searchResult.results.forEach({ (tracks) in
                    print(tracks.artistName, tracks.trackName)
                })
            }catch let decodeErr{
                print("Error al decodificar", decodeErr)
            }
            
            
        
        
        
        }
    }
    
    // Parte 9 - 1
    struct SearchResults: Decodable{
        let resultCount: Int
        
        //Parte 9 - 4
        let results: [Tracks]
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Category.samples().count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        
        cell.albumCategory = albumCategories?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
}








