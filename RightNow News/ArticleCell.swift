//
//  ArticleCell.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 23/02/2022.
//

import UIKit
import Kingfisher

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headLineLabel.text?.removeAll()
        articleImageView.image = nil
    }
    
    func populate(with article: Article) {
        headLineLabel.text = article.headline
        
        if let urlToImage = article.urlToImage {
            let url = URL(string: urlToImage)
            articleImageView.kf.setImage(with: url)
        }
    }
}
