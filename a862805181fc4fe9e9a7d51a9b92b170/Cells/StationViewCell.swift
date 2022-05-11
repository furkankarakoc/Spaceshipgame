//
//  StationViewCell.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import UIKit

class StationViewCell: UITableViewCell {


    static let identifier = "StationViewCell"
    
    lazy var name: UILabel = {
        let label = UILabel(frame: CGRect(x: 5, y: 5, width: 200.0, height: 24.0))
        label.text = "furkan"
        label.textColor = .black
        return label
    }()
    
    lazy var EUS: UILabel = {
        let label = UILabel(frame: CGRect(x: 5, y: 40, width: 200.0, height: 24.0))
        label.text = "500"
        label.textColor = .black
        return label
    }()

    private let favoriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .systemRed
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        addSubview(name)
        addSubview(EUS)
        addSubview(favoriteImage)
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //applyConstraints()
        
        favoriteImage.frame = CGRect(x: contentView.frame.size.width - 40, y: 20, width: 20, height: 20)
    }

    func configure(with model: String) {

        favoriteImage.image = UIImage(systemName: "heart")
        print(model)
    }
}
