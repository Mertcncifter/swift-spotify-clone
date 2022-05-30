//
//  PlayerControlsView.swift
//  Spotify
//
//  Created by mert can çifter on 29.05.2022.
//

import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapPlayForwardButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapPlayBackwardsButton(_ playerControlsView: PlayerControlsView)
    func playerControlsView(_ playerControlsView: PlayerControlsView, didSlideSlider value: Float)
}

struct PlayerControlsViewViewModel {
    let title: String?
    let subtitle: String?
}

class PlayerControlsView: UIView {

    weak var delegate : PlayerControlsViewDelegate?
    
    // MARK: - Properties
    
    private var isPlaying = true
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        return slider
    }()
    
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "This is My Song"
        label.font = .systemFont(ofSize: 20, weight:. semibold)
        return label
    }()
    
    private let subtitleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Drake (feat. Some Other Artist)"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(volumeSlider)
        volumeSlider.addTarget(self, action: #selector(didSlideSlider(_: )), for: .valueChanged)
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 15, paddingLeft: 15)
        subtitleLabel.anchor(top: nameLabel.bottomAnchor,left: leftAnchor, paddingTop: 10, paddingLeft: 15)
        
        volumeSlider.setDimensions(width: width, height: height * 0.2)
        volumeSlider.anchor(top: subtitleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 20, paddingLeft: 20 ,paddingRight: 20)
        volumeSlider.centerY(inView: self)
        
        
        let stackView = UIStackView(arrangedSubviews: [backButton,playPauseButton,nextButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        addSubview(stackView)
     
        stackView.anchor(top: volumeSlider.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 30,paddingRight: 30)
        
        
    }
    
    // MARK: - Selectors
    
    @objc private func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        delegate?.playerControlsView(self, didSlideSlider: value)
    }
    
    @objc private func didTapBack(){
        delegate?.playerControlsViewDidTapPlayBackwardsButton(self)
    }
    
    @objc private func didTapNext(){
        delegate?.playerControlsViewDidTapPlayForwardButton(self)
    }
    
    @objc private func didTapPlayPause(){
        self.isPlaying = !isPlaying
        delegate?.playerControlsViewDidTapPlayPauseButton(self)
        
        let pause = UIImage(systemName: "pause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        let play = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        playPauseButton.setImage(isPlaying ? pause : play, for: .normal)
    }
    
    func configure(with viewModel: PlayerControlsViewViewModel) {
        nameLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }

}
