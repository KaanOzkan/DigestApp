//
//  Media.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-03.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import Foundation

class Media {
	// MARK: Properties
	var name: String
	var data = [String: String]()

	let gateKeeper = Gatekeeper.shared

	init?(name: String, data: [String: String]) {
		self.name = name
		self.data = data

//		gateKeeper.delegate = self

		// request info from Gatekeeper asynchronously
		gateKeeper.requestData(media: "reddit") { responseObject, error in
			// handle response
			print(responseObject)
		}
	}

//	// Gatekeeper received information
//	func didRecieveDataUpdate(data: String) {
//		// data param has necessary info
//		print(data)
//	}
}
