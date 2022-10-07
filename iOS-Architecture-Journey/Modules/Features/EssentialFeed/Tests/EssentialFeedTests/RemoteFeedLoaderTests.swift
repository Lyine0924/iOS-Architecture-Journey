//
//  RemoteFeedLoaderTests.swift
//  
//
//  Created by Lyine on 2022/10/07.
//

import XCTest

class RemoteFeedLoader {
	
	let client: HTTPClient
	let url: URL
	
	init(
		url: URL,
		client: HTTPClient
	) {
		self.url = url
		self.client = client
	}
	
	func load() {
		client.get(from: url)
	}
}

protocol HTTPClient {
	func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
	
	func get(from url: URL) {
		requestedURL = url
	}
	
	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
	
	func test_init_doesNotRequestDataFromURL() {
		let url = URL(string: "https://a-given-url.com")!
		let (_, client) = makeSUT(url: url)
		
		XCTAssertNil(client.requestedURL)
	}
	
	func test_load_requestDataFromURL() {
		let url = URL(string: "https://a-given-url.com")!
		let (sut, client) = makeSUT(url: url)
		
		sut.load()
		
		XCTAssertNotNil(client.requestedURL)
	}
	
}

// MARK: - Helpers
extension RemoteFeedLoaderTests {
	private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
		let client = HTTPClientSpy()
		let sut = RemoteFeedLoader(url: url, client: client)
		return (sut, client)
	}
	
	private class HTTPClientSpy: HTTPClient {
		var requestedURL: URL?
		
		func get(from url: URL) {
			requestedURL = url
		}
	}
}
