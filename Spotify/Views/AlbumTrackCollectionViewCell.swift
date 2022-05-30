//
//  AlbumTrackCollectionViewCell.swift
//  Spotify
//
//  Created by mert can çifter on 27.05.2022.
//



import UIKit

class AlbumTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumTrackCollectionViewCell"
    
    // MARK: - Properties
    

    
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
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
       
        let trackStackView = UIStackView(arrangedSubviews: [trackNameLabel,artistNameLabel])
        trackStackView.axis = .vertical
        trackStackView.distribution = .fillProportionally
        trackStackView.spacing = 4
        contentView.addSubview(trackStackView)
        trackStackView.centerX(inView: contentView)
        trackStackView.anchor(top: contentView.topAnchor,
                              bottom: contentView.bottomAnchor,
                              paddingLeft: 5,
                              paddingRight: 5
                
        )
    }
    
    func configure(with viewModel: AlbumCollectionViewCellViewModel) {
        artistNameLabel.text = viewModel.artistName
        trackNameLabel.text = viewModel.name
    }
}
