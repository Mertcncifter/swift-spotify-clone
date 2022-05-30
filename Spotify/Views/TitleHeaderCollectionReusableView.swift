//
//  TitleHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by mert can çifter on 27.05.2022.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier =  "TitleHeaderCollectionReusableView"
        
    // MARK: - Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 15, y: 0, width: width - 30, height: height)
    }
    
    
    // MARK: - Lifecycle
    
    func configure(with title: String){
        label.text = title
    }
    
    
}
