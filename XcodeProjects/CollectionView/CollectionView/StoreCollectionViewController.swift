//
//  StoreCollectionViewController.swift
//  CollectionView
//
//  Created by José Manuel García Chávez on 4/21/18.
//  Copyright © 2018 Diplomado. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class StoreCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    var albumCategories : [Category]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = .white
        
        albumCategories = Category.samples()
        Category.SaveService()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        //cell.backgroundColor = .red
    
        // Configure the cell
        cell.albumCategory = albumCategories?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
    
    
    
}
