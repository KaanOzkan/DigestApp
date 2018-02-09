//
//  Gatekeeper.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-08.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//// Gatekepper shouldn't know about its drivers
//protocol GatekeeperDelegate: class {
//	func didRecieveDataUpdate(data: String)
//}

class Gatekeeper {
	static let shared = Gatekeeper()
//	weak var delegate: GatekeeperDelegate?

	func requestData(media: String, completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
		// Switch
		if(media == "reddit"){
			getRedditData(completionHandler: completionHandler)
		}
	}

	func getRedditData(completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
		Alamofire.request("https://digestmedia.herokuapp.com").responseJSON { response in
			switch response.result {
			case .success(let value):
				completionHandler(value as? NSDictionary, nil)
			case .failure(let error):
				completionHandler(nil, error)
			}
		}

	}
}
