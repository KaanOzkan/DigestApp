//
//  ViewController.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-03.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
	var webView: WKWebView!
	var reddit: Media?

	override func loadView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		if(reddit?.data["gunners"] == nil){
			sleep(2)
		}
		//TODO: Modify
		let string = "https://www.reddit.com" + (reddit?.data["gunners"])!
		let url = URL(string: string)
		webView.load(URLRequest(url: url!))
		webView.allowsBackForwardNavigationGestures = true
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

