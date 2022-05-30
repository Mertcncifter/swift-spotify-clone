//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 23.05.2022.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    // MARK: - Properties
    
    private let playlistCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
        
    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistNameLabel.text = nil
        creatorNameLabel.text = nil
        playlistCoverImageView.image = nil
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
        playlistCoverImageView.setDimensions(width: contentView.height * 0.6, height: contentView.height * 0.6)
        playlistCoverImageView.layer.cornerRadius = 5
        playlistCoverImageView.centerX(inView: contentView)
        playlistCoverImageView.anchor(top: topAnchor, paddingTop: 10)
        playlistNameLabel.centerX(inView: contentView)
        playlistNameLabel.anchor(top: playlistCoverImageView.bottomAnchor, paddingTop: 5)
        creatorNameLabel.centerX(inView: contentView)
        creatorNameLabel.anchor(top: playlistNameLabel.bottomAnchor, paddingTop: 5)
        
    }
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistNameLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
