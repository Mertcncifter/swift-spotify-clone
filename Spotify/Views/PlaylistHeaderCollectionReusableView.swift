//
//  PlaylistHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by mert can çifter on 25.05.2022.
//

import UIKit
import SDWebImage

protocol PlaylistHeaderCollectionReusableViewDelegate: AnyObject {
    func PlaylistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView)
}

class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "PlaylistHeaderCollectionReusableView"
    
    // MARK: - Properties
    
    weak var delegate: PlaylistHeaderCollectionReusableViewDelegate?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22,weight: .semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let ownerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,weight: .light)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private let playAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        let image = UIImage(systemName: "play.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30,weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 35
        button.layer.masksToBounds = true
        button.setDimensions(width: 70, height: 70)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(playAllButton)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(ownerLabel)
        playAllButton.addTarget(self, action: #selector(self.didTapPlayAll), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.setDimensions(width: 200 , height: 200)
        imageView.centerX(inView: self)
        imageView.anchor(top: topAnchor, paddingTop: 20)
        
        nameLabel.anchor(top: imageView.bottomAnchor)
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 20)
        ownerLabel.anchor(bottom: bottomAnchor)
        
        
     
        
        
        playAllButton.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 5, paddingRight: 5)
       
       
    }
    
    // MARK: - Selectors
    
    @objc private func didTapPlayAll(){
        delegate?.PlaylistHeaderCollectionReusableViewDidTapPlayAll(self)
    }
    
    // MARK: - Helpers
    
    func configure(with viewModel: PlaylistHeaderViewViewModel){
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.description
        imageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        
    }
    
    
}
