//
//  ViewController.swift
//  page-scroll
//
//  Created by Alex Sanchez on 31/7/16.
//  Copyright © 2016 Alex Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let MAX_SWIPES_IN_SAME_DIRECTION = 2
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    var swipesToRight = 0; var swipesToLeft = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector (self.respondToSwipeGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector (self.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollView.frame.size.width / 2 + scrollView.frame.size.width * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 3, height: view.frame.size.height)
    }

    func respondToSwipeGesture(gesture: UISwipeGestureRecognizer){
        if (swipesToLeft < MAX_SWIPES_IN_SAME_DIRECTION && gesture.direction == UISwipeGestureRecognizerDirection.left)
        {
            let point: CGPoint = CGPoint(x: scrollView.frame.size.width, y: 0.0)
            scrollView.setContentOffset(point, animated: true)
            swipesToLeft += 1
            swipesToRight -= 1
            print("Swiped left")
        }
        
//            switch gesture.direction {
//            case UISwipeGestureRecognizerDirection.right:
//                scrollView.setContentOffset(point, animated: true)
//                print ("Swiped right")
//            case UISwipeGestureRecognizerDirection.left:
//                scrollView.setContentOffset(point, animated: true)
//                print("Swiped left")
//            default:
//                break
//            }
        
        
    }
}



