//
//  ServiceViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 10/02/21.
//

import UIKit

class ServiceViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var imageArray = [#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "3")]
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.numberOfPages = imageArray.count
        pageController.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        whiteView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        blueView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        
        
    }

    @objc func changeImage()  {
        let index = IndexPath.init(item: counter, section: 0)
        if counter < imageArray.count{
           
            pageController.currentPage = counter
           self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageController.currentPage = counter
            counter += 1
            
            
        }else{
            
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
            
            
            
            pageController.currentPage = counter
            counter = 1
        }
    }
    
    

    @IBAction func backToHomeButtonPressed(_ sender: Any) {
    }
    
}


extension ServiceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SevicePaginationCollectionViewCell = self.collectionView1.dequeueReusableCell(withReuseIdentifier: "SevicePaginationCollectionViewCell", for: indexPath) as! SevicePaginationCollectionViewCell
        cell.imgView.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414 , height: 300)
    }
    
    
    
    
    
    
    
    
    
    
    
}
