//
//  OnboardScreenViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 08/02/21.
//

import UIKit

class OnboardScreenViewController: UIViewController {

    
//    func playVideo()  {
//        guard let path = Bundle.main.path(forResource: "nature", ofType: "mp4")else{
//            return
//        }
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        playerLayer.videoGravity = .resizeAspectFill
//        self.videoLayer.layer.addSublayer(playerLayer)
//        player.play()
//        videoLayer.bringSubviewToFront(aaranyaLabel)
//        videoLayer.bringSubviewToFront(quoteLabel)
//        videoLayer.bringSubviewToFront(smallQuote)
//    
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        let signVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
    present(signVC, animated: true, completion: nil)
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
    present(loginVC, animated: true, completion: nil)
    }
    
}
