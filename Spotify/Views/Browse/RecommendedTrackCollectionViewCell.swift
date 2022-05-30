//
//  RecommendedTrackCollectionViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 23.05.2022.
//

import UIKit

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendedTrackCollectionViewCell"
    
    // MARK: - Properties
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
        
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
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
        trackNameLabel.text = nil
        artistNameLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
        albumCoverImageView.setDimensions(width: contentView.height, height: contentView.height)
        albumCoverImageView.anchor(top: topAnchor,bottom: bottomAnchor, paddingTop: 5, paddingBottom: 5)
        let trackStackView = UIStackView(arrangedSubviews: [trackNameLabel,artistNameLabel])
        trackStackView.axis = .vertical
        trackStackView.distribution = .fillProportionally
        trackStackView.spacing = 4
        contentView.addSubview(trackStackView)
        trackStackView.setDimensions(width: contentView.width - albumCoverImageView.width, height: contentView.height)
        trackStackView.anchor(top: contentView.topAnchor,
                              left: albumCoverImageView.rightAnchor,
                              bottom: contentView.bottomAnchor,
                              paddingLeft: 5,
                              paddingRight: 5
                
        )
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        artistNameLabel.text = viewModel.artistName
        trackNameLabel.text = viewModel.name
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
