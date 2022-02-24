//
//  NewsVC.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 23/02/2022.
//

import UIKit

//private let reuseIdentifier = "Cell"

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article(headline: "This is news"), Article(headline: "This is news also news"), Article(headline: "This is news but not really")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        
        let article = articles[indexPath.item]
        cell.populate(with: article)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = 240
        let width = (collectionView.frame.width / 2) - 2
        let size = CGSize(width: width, height: height)
        return size
        
    }
    
    
    
}
