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

	init?(name: String) {
		self.name = name

//		gateKeeper.delegate = self

		// request info from Gatekeeper asynchronously
		gateKeeper.requestData(media: "reddit") { responseValue, error in
			if(error != nil) {
				// Throw
				return
			}
			// handle response
			self.data = ["gunners": responseValue as! String]
		}
	}

//	// Gatekeeper received information
//	func didRecieveDataUpdate(data: String) {
//		// data param has necessary info
//		print(data)
//	}
}
