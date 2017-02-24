//
//  ViewController.swift
//  GCD_QOS
//
//  Created by mac on 2/24/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchImage() {
            let imageURL: URL = URL(string: "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
            
            (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
                
                if let data = imageData {
                    print("Did download image data")
                    
                    DispatchQueue.main.async {
                       self.imageView.image = UIImage(data: data)
                    }
                    
                 //self.imageView.image = UIImage(data: data)
                }
            }).resume()
    }

}

