//
//  KeyboardViewController.swift
//  SampleKeyboard
//
//  Created by Himanshu Lanjewar on 05/08/20.
//

import UIKit
import AudioToolbox

class KeyboardViewController: UIInputViewController {

    var sampleView: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadInterface()
    
        // Double Tap
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTapGesture)
    }
    
    override func viewWillLayoutSubviews() {
       
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        // load the nib file
        let sampleNib = UINib(nibName: "SampleKeyboard", bundle: nil)
        // instantiate the view
        sampleView = sampleNib.instantiate(withOwner: self, options: nil)[0] as? UIView
        self.view.frame.size.height = 160
        self.view.frame.size.width = 320
        
        // add the interface to the main view
        view.addSubview(sampleView)
        
        // copy the background color
        view.backgroundColor = sampleView.backgroundColor
    }
    
    // Double tap action
    @objc func handleDoubleTap() {
        print("Double Tap Click")
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
}
