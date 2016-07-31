//
//  ViewController.swift
//  page-scroll
//
//  Created by Alex Sanchez on 31/7/16.
//  Copyright © 2016 Alex Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    let MAX_PAGE = 2
    let MIN_PAGE = 0
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    
    @IBAction func detectSwipe (_ sender: UISwipeGestureRecognizer){
        if (currentPage < MAX_PAGE && sender.direction == UISwipeGestureRecognizerDirection.left){
                    moveScrollView(direction: 1)
                }
        
                if (currentPage > MIN_PAGE && sender.direction == UISwipeGestureRecognizerDirection.right)
                {
                    moveScrollView(direction: -1)
                }
    }
    
    func moveScrollView(direction: Int)
    {
        currentPage = currentPage + direction
        let point: CGPoint = CGPoint(x: scrollView.frame.size.width * CGFloat(currentPage), y: 0.0)
        scrollView.setContentOffset(point, animated: true)
    }
}




