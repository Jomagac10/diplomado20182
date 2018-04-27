//
//  CategoryCell.swift
//  CollectionView
//
//  Created by José Manuel García Chávez on 4/21/18.
//  Copyright © 2018 Diplomado. All rights reserved.
//

import UIKit

class  CategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    let albumCellID = "albumCell"
    var albumCategories : [Category]?
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    required init? (coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    let AlbumCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.backgroundColor = .cyan
        collectionView.backgroundColor = .clear

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        //label.textAlignment = .center
        label.text = "Category"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var albumCategory: Category?{
        didSet{
            if let name = albumCategory?.name{
                categoryLabel.text = name
            }
        }
    }
    
    
    func setupLayout (){
        addSubview(AlbumCollectionView)
        addSubview(categoryLabel)
        
        AlbumCollectionView.dataSource = self
        AlbumCollectionView.delegate = self
        
        AlbumCollectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumCellID)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": AlbumCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]-5-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": AlbumCollectionView, "v1": categoryLabel]))

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumCellID, for: indexPath) as! AlbumCell
        //cell.backgroundColor = .yellow
        cell.album = albumCategory?.albums![indexPath.item]
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
}
