//
//  FeedLoader.swift
//  
//
//  Created by Lyine on 2022/10/07.
//

import Foundation

enum LoadFeedResult {
	case success([FeedItem])
	case error(Error)
}

protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
