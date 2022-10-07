//
//  RemoteFeedLoaderTests.swift
//  
//
//  Created by Lyine on 2022/10/07.
//

import XCTest

class RemoteFeedLoader {
	
}

class HTTPClient {
	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
	
	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClient()
		_ = RemoteFeedLoader()
		
		XCTAssertNil(client.requestedURL)
	}
	
}
