//
//  AddArticleDelegate.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/22.
//

import Foundation

protocol PostArticleDelegate {
    func updateNewArticle(_ theme: ArticleTheme, _ article: Article)
}
