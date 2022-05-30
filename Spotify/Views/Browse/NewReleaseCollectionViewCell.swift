//
//  NewReleaseCollectionViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 23.05.2022.
//

import UIKit
import SDWebImage

class NewReleaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewReleaseCollectionViewCell"
    
    // MARK: - Properties
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let numberOfTracksLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        /*contentView.addSubview(albumNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.clipsToBounds = true
        contentView.addSubview(numberOfTracksLabel)*/
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumNameLabel.sizeToFit()
        configureUI()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
        albumCoverImageView.anchor(top: topAnchor,bottom: bottomAnchor, paddingTop: 5, paddingBottom: 5)
        albumCoverImageView.setDimensions(width: contentView.height, height: contentView.height)
        
        let albumArtistStackView = UIStackView(arrangedSubviews: [albumNameLabel,artistNameLabel,numberOfTracksLabel])
        albumArtistStackView.axis = .vertical
        albumArtistStackView.distribution = .fillProportionally
        albumArtistStackView.spacing = 4
        albumArtistStackView.sizeToFit()
        contentView.addSubview(albumArtistStackView)
        albumArtistStackView.setDimensions(width: contentView.width - albumCoverImageView.width - 10, height: contentView.height)
        albumArtistStackView.anchor(left: albumCoverImageView.rightAnchor)
        
  
        
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        albumNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
    
}
