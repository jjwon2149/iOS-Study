//
//  PostTableViewCell.swift
//  Socially-UIKit
//
//  Created by 정종원 on 7/25/24.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: 320),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    func configureItem(with item: Post) {
        descriptionLabel.text = item.description
        
        // Load the image asynchronously using Kingfisher
        let processor = DownsamplingImageProcessor(size: postImageView.bounds.size)
        postImageView.kf.indicatorType = .activity
        if let imageURL = item.imageURL {
            postImageView.kf.setImage(
                with: URL(string: imageURL)!,
                placeholder: UIImage(systemName: "photo.artframe"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.2)),
                    .cacheOriginalImage
                ]
            )
        } else {
            if let path = item.path {
                item.checkImageURL(path)
            }
            postImageView.image = UIImage(systemName: "photo.artframe")
        }
    }
}
