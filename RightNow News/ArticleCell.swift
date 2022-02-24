//
//  ArticleCell.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 23/02/2022.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    
    func populate(with article: Article) {
        headLineLabel.text = article.headline
    }
    
}
