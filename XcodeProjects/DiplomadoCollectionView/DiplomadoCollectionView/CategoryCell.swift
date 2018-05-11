//
//  CategoryCell.swift
//  DiplomadoCollectionView
//
//  Created by Germán Santos Jaimes on 4/21/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    let albumCellId = "albumCell"
//    var albumCategories: [Category]?
    
    var albumCategory: Category?{
        didSet{
            if let name = albumCategory?.name{
                categoryLabel.text = name
            }
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let AlbumCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = UIColor.white
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionview
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Rock"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupLayout(){
//        backgroundColor = UIColor.red
        addSubview(AlbumCollectionView)
        addSubview(categoryLabel)
        
        AlbumCollectionView.dataSource = self
        AlbumCollectionView.delegate = self
        
        AlbumCollectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumCellId)

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": AlbumCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": AlbumCollectionView, "v1": categoryLabel]))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
       
        return albumCategory?.albums?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumCellId, for: indexPath) as! AlbumCell
  
        cell.backgroundColor = UIColor.white
        
        cell.album = albumCategory?.albums![indexPath.item]
        print(indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    
}







