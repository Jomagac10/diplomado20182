//
//  Album.swift
//  CollectionView
//
//  Created by José Manuel García Chávez on 4/21/18.
//  Copyright © 2018 Diplomado. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell{
    
    var album: Album?{
        didSet{
            if let name = album?.name{
                titleLabel.text = name
            }
        }
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    required init? (coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Illuminati")
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Illuminati"
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Mentes brillantes"
        label.font = .systemFont(ofSize: 11)
        label.numberOfLines = 2
        return label
    }()
    
    func setupLayout(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(categoryLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        titleLabel.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width+40, width: frame.width, height: 40)
        

    }
    
    
}
