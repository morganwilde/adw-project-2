//
//  MapSelectorController.swift
//  Platformer
//
//  Created by Simas Abramovas on 2/21/15.
//  Copyright (c) 2015 Simas Abramovas. All rights reserved.
//

import Foundation
import UIKit

class MapSelectorController: UIViewController  {
    
    @IBOutlet var mapPreview: UIImageView!
    // Every map selection (should be an array or indexed buttons)
    @IBOutlet var map1: UIButton!
    @IBOutlet var map2: UIButton!
    @IBOutlet var map3: UIButton!
    @IBOutlet var map4: UIButton!
    @IBOutlet var map5: UIButton!
    
    var imageUrls = [String]()


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageUrls.append("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
        imageUrls.append("http://www.psdgraphics.com/file/colorful-triangles-background.jpg")
        imageUrls.append("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
        imageUrls.append("http://www.psdgraphics.com/file/colorful-triangles-background.jpg")
        imageUrls.append("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
    }
    
    @IBAction func mapSelected(sender: UIButton) {
        var data : NSData?
        
        // Fetch url from button
        var urlStr : String?
        var image : UIImage?
        
        
        if let title = sender.titleLabel?.text {
            let lastChar = title[advance(title.startIndex, countElements(title) - 1)]
            switch lastChar {
            case "1":
                image = fetchImage(imageUrls[0])
            case "2":
                image = fetchImage(imageUrls[1])
            case "3":
                image = fetchImage(imageUrls[2])
            case "4":
                image = fetchImage(imageUrls[3])
            case "5":
                image = fetchImage(imageUrls[4])
            default:
                image = fetchImage(imageUrls[0])
            }
        }
        
        mapPreview.contentMode = UIViewContentMode.ScaleAspectFit
        mapPreview.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set button backgrounds (should use assets)
        map1.addSubview(fetchImageInView(imageUrls[0], container: map1)!)
        map2.addSubview(fetchImageInView(imageUrls[1], container: map1)!)
        map3.addSubview(fetchImageInView(imageUrls[2],
            container: map1)!)
        map4.addSubview(fetchImageInView(imageUrls[3],
            container: map1)!)
        map5.addSubview(fetchImageInView(imageUrls[4],
            container: map1)!)
        
    }
    
    func fetchImageInView(url : String, container : UIView) -> UIImageView? {
        var bgImage = UIImageView(image: fetchImage(url))
        bgImage.contentMode = UIViewContentMode.ScaleAspectFit
        bgImage.frame = CGRect(x: 0, y: 0, width: map1.frame.size.width, height: map1.frame.size.height)
        
        return bgImage;
    }
    
    func fetchImage(url : String) -> UIImage? {
        if let myUrl = NSURL(string: url) {
            if let data = NSData(contentsOfURL: myUrl) {
                return UIImage(data: data)

            } else {
                println("Error couldn't fetch img \(url)")
            }
        } else {
            println("Error invalid url \(url)")
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}