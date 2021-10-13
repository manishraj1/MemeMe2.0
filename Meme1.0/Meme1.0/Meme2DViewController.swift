//
//  Meme2DViewController.swift
//  Meme1.0
//
//  Created by Manish raj(MR) on 11/10/21.
//

import UIKit

class Meme2DViewController: UIViewController {
    
    @IBOutlet weak var fullmemeImage : UIImageView!
    
    var MemeD: PopMeme2!
    
    override func viewWillAppear(_ animated: Bool) {
        fullmemeImage.image = MemeD.fullmemeImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
