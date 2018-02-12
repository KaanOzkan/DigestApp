//
//  Media.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-03.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol DataModelDelegate: class {
	func didRecieveDataUpdate()
}

class Media {
	// MARK: Properties
	var name: String
	var names = [String]()
	var data = [String: String]()
	weak var delegate: DataModelDelegate?
	let gateKeeper = Gatekeeper.shared

	init?(name: String) {
		self.name = name

		// request info from Gatekeeper asynchronously
		gateKeeper.requestData(media: self.name) { responseValue, error in
			if(error != nil) {
				// Throw
				return
			}
			// handle response
			var json = JSON(responseValue!)
			self.data = json.dictionaryObject as! [String:String]
			print(self.data)
			print("reloading")
			self.delegate?.didRecieveDataUpdate()
		}
	}
}
