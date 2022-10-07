//
//  RemoteFeedLoader.swift
//  
//
//  Created by Lyine on 2022/10/07.
//

import Foundation

public protocol HTTPClient {
	func get(from url: URL)
}

public class RemoteFeedLoader {
	
	private let client: HTTPClient
	private let url: URL
	
	public init(
		url: URL,
		client: HTTPClient
	) {
		self.url = url
		self.client = client
	}
	
	public func load() {
		client.get(from: url)
	}
}
