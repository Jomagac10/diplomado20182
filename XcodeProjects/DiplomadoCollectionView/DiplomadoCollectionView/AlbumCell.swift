//
//  AlbumCell.swift
//  DiplomadoCollectionView
//
//  Created by Germán Santos Jaimes on 4/21/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell{
    
    var album: Album?{
        didSet{
            if let name = album?.name{
                titleLabel.text = name
            }
            
            if let category = album?.category{
                categoryLabel.text = category
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
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "cover1")
        iv.layer.cornerRadius = 18
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Queen, el mejor de los mejores"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Rock y ya"
        label.font = UIFont.systemFont(ofSize: 11)
        label.numberOfLines = 2
        return label
    }()
    
    func setupLayout(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(categoryLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        titleLabel.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 40)

    }
    
}
