//
//  ArticleVC.swift
//  RightNow News
//
//  Created by Kamil Niemczyk on 24/02/2022.
//

import UIKit
import WebKit
import AVKit

class ArticleVC: UIViewController {
    
    @IBOutlet weak var articleWebView: WKWebView!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let articleUrl = article?.url, let url = URL(string: articleUrl) {
            
            let request = URLRequest(url: url)
            articleWebView.setAllMediaPlaybackSuspended(true, completionHandler: .none)
            articleWebView.load(request)
           
        }
    }
    
}
