//
//  KnowHealerViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 07/02/21.
//

import UIKit

class KnowHealerViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
   
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    
    @IBOutlet weak var pageController1: UIPageControl!
    @IBOutlet weak var colectionView2: UICollectionView!
    
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    var imageArray = [#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "3")]
    var timer = Timer()
    var counter = 0
    
    override func viewDidLayoutSubviews() {
        whiteView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        blueView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        
        setupShadow()
    }
    
    
    
    func setupShadow()  {
        
        
       
        detailView.layer.shadowColor = UIColor.systemBlue.cgColor
        detailView.layer.shadowOpacity = 0.075
        detailView.layer.shadowOffset = .zero
        detailView.layer.shadowRadius = 3
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        pageController.numberOfPages = imageArray.count
        pageController.currentPage = 0
        pageController1.numberOfPages = imageArray.count
        pageController1.currentPage = 0
        
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    
    
    
    @objc func changeImage()  {
        let index = IndexPath.init(item: counter, section: 0)
        if counter < imageArray.count{
            
            self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageController.currentPage = counter
            self.colectionView2.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageController.currentPage = counter
            counter += 1
            
            
        }else{
            
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
            pageController.currentPage = counter
            self.colectionView2.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
            pageController1.currentPage = counter
            counter = 1
        }
    }
    

    
}

extension KnowHealerViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView1{
            return imageArray.count
        }else{
            
            return imageArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView1{
            let cell: KnowHealerCollectionViewCell = collectionView1.dequeueReusableCell(withReuseIdentifier: "KnowHealerCollectionViewCell", for: indexPath) as! KnowHealerCollectionViewCell
            cell.imgView.image = imageArray[indexPath.row]
            
            return cell
        }else{
            
            let cell: HappyFaceViewAllCollectionViewCell = colectionView2.dequeueReusableCell(withReuseIdentifier: "HappyFaceViewAllCollectionViewCell", for: indexPath) as! HappyFaceViewAllCollectionViewCell
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView1{
            
            return CGSize(width: 414 , height: 300)
        }else{
            
            return CGSize(width: 414 , height: 150)
        }
       
    }
    
    
    
}

