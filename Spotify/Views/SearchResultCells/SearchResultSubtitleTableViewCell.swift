//
//  SearchResultSubtitleTableViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 29.05.2022.
//

import UIKit
import SDWebImage


class SearchResultSubtitleTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultSubtitleTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
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
        //contentView.addSubview(label)
        //contentView.addSubview(subtitleLabel)
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
            
        let stackView = UIStackView(arrangedSubviews: [label,subtitleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        
        contentView.addSubview(stackView)
        stackView.setDimensions(width: contentView.width - iconImageView.width, height: contentView.height)
        stackView.anchor(left: iconImageView.rightAnchor, paddingLeft: 10)
    
        iconImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        subtitleLabel.text = nil
    }
    
    func configure(with viewModel: SearchResultSubtitleTableViewCellViewModel) {
        label.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        iconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }

}


