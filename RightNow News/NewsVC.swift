//
//  NewsVC.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 23/02/2022.
//

import UIKit
import Alamofire
import Kingfisher

//https://newsapi.org/v2/top-headlines
//8210d388fb7f4522a623b23854721bf4

//private let reuseIdentifier = "Cell"

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
    }
    
    func getArticles() {
        let parameters: Parameters = ["country": "us",
                                      "apiKey": "8210d388fb7f4522a623b23854721bf4"]
        AF.request("https://newsapi.org/v2/top-headlines", parameters: parameters).responseData { (response) in
            guard let data = response.data else { return }
        
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                 let topHeadlineResponse = try JSONDecoder().decode(TopHeadlineResponse.self, from: data)
                self.articles = topHeadlineResponse.articles
                self.collectionView.reloadData()
                
            } catch {
                print(error)
            }
        
        }
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let height: CGFloat = 240
//        let width = (collectionView.frame.width / 2) - 2
//        let size = CGSize(width: width, height: height)
//        return size
//
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let article = articles[indexPath.item]
        performSegue(withIdentifier: "seque.Main.newsToArticle", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let articleVC = segue.destination as? ArticleVC, let article = sender as? Article {
            articleVC.article = article
        }
        
    }
    
}
