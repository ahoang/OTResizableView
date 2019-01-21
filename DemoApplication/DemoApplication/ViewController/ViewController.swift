//
//  ViewController.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/08/27.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

import OTResizableView

class ViewController: UIViewController,OTResizableViewDelegate {

    var resizableView = OTResizableView(contentView: UITextView())
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yourView = UITextView(frame: CGRect(x: 70, y: 70, width: 200, height: 0))
        yourView.text = "HELLO THERE THIS IS A TEXTVIEW"
        yourView.isEditable = false
        yourView.isSelectable = false
        yourView.isScrollEnabled = false
        yourView.sizeToFit()
        yourView.textAlignment = .center
        resizableView = OTResizableView(contentView: yourView)
        resizableView.backgroundColor = .yellow
        resizableView.delegate = self;
        
        mainView.addSubview(resizableView)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tappedChangeAspectButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            resizableView.keepAspectEnabled = true
        } else {
            resizableView.keepAspectEnabled = false
            resizableView.minimumWidth = 100
            resizableView.minimumHeight = 0
        }
    }
    
    func tapBegin(_ resizableView: OTResizableView) {
        resizableView.resizeEnabled = resizableView.resizeEnabled ? false : true
        
        print("tapBegin:\(resizableView.frame)")
    }
    
    
    func tapChanged(_ resizableView: OTResizableView) {
        print("tapChanged:\(resizableView.frame))")
    }
    
    
    func tapMoved(_ resizableView: OTResizableView) {
        print("tapMoved:\(resizableView.frame))")
    }
    
    
    func tapEnd(_ resizableView: OTResizableView) {
        print("tapEnd:\(resizableView.frame)")
    }
}
