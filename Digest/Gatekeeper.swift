//
//  Gatekeeper.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-08.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import Foundation
import Alamofire

//// Gatekepper shouldn't know about its drivers
//protocol GatekeeperDelegate: class {
//	func didRecieveDataUpdate(data: String)
//}

class Gatekeeper {
	static let shared = Gatekeeper()
//	weak var delegate: GatekeeperDelegate?

	func requestData(media: String, completionHandler: @escaping (Any?, Error?) -> ()) {
		// Switch
		if(media == "reddit"){
			getRedditData(completionHandler: completionHandler)
		}
	}

	func getRedditData(completionHandler: @escaping (Any?, Error?) -> ()) {
		Alamofire.request("https://digestmedia.herokuapp.com/media/reddit.json").responseJSON { response in
			if response.result.isSuccess{
				let data = response.result.value!
				completionHandler(data, nil)
			}
			else if response.result.isFailure{
				print("Couldn't get a reddit response")
				let error : NSError = response.result.error! as NSError
				completionHandler(nil, error)
			}
		}

	}
}
