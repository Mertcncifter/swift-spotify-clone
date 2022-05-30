//
//  SearchResultDefaultTableViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 29.05.2022.
//

import UIKit
import SDWebImage


class SearchResultDefaultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultDefaultTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize : CGFloat = contentView.height - 10
        iconImageView.setDimensions(width: imageSize , height: imageSize)
        iconImageView.centerY(inView: contentView)
        iconImageView.anchor(left: contentView.leftAnchor, paddingLeft: 5)
        label.setDimensions(width: contentView.width - iconImageView.width, height: contentView.height)
        label.anchor(left: iconImageView.rightAnchor, paddingLeft: 10)
     
        
        iconImageView.layer.cornerRadius = imageSize / 2
        iconImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
    }
    
    func configure(with viewModel: SearchResultDefaultTableViewCellViewModel) {
        label.text = viewModel.title
        iconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }

}
