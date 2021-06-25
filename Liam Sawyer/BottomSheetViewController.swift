//
//  BottomViewController.swift
//  AnyZoneApp
//
//  Created by Anıl Taşkıran on 23.06.2019.
//  Copyright © 2019 Creabbit. All rights reserved.
//

import UIKit


extension BottomSheetViewController {
    private enum State {
        case partial
        case full
    }
    
    private enum Constant {
        static let fullViewYPosition: CGFloat = 200
        static var partialViewYPosition: CGFloat { UIScreen.main.bounds.height - 240 }
    }
}

class BottomSheetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(gesture)
        roundViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.0, animations: {
            self.moveView(state: .partial)
        })
    }
    
    private func moveView(state: State) {
        let yPosition = state == .partial ? Constant.partialViewYPosition : Constant.fullViewYPosition
        view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
    }

    private func moveView(panGestureRecognizer recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let minY = view.frame.minY
        
        if (minY + translation.y >= Constant.fullViewYPosition) && (minY + translation.y <= Constant.partialViewYPosition) {
            view.frame = CGRect(x: 0, y: minY + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: view)
        }
    }
    
    @objc private func panGesture(_ recognizer: UIPanGestureRecognizer) {
        moveView(panGestureRecognizer: recognizer)
        
        if recognizer.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.allowUserInteraction], animations: {
                let state: State = recognizer.velocity(in: self.view).y >= 5 ? .partial : .full
                self.moveView(state: state)
            }, completion: nil)
        }
    }
    
    func roundViews() {
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
    }
    @IBAction func Linkden_Button(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.linkedin.com/in/sawyerliam/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func SquareSpace_Button(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.sawyerliam.com")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func Facebook_Button(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.facebook.com/Liam-Sawyer-102505385419971")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    
    
}



