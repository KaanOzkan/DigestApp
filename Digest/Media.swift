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

	init?(name: String, data: [String: String]) {
		self.name = name
		self.data = data
	}
}
