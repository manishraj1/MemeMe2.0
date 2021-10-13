//
//  Meme2CCollectionViewController.swift
//  Meme1.0
//
//  Created by Manish raj(MR) on 11/10/21.
//

import UIKit

private let reuseIdentifier = "Meme2CCollectionViewController"

class Meme2CCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowlayout: UICollectionViewFlowLayout!
    
    let memelist = PopMeme2.memelist
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(upload))
                
        navigationItem.rightBarButtonItem?.isEnabled = true
                
        collectionView?.reloadData()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Sent Meme"
               
        self.tabBarItem.image = UIImage(named: "collection")
        
        self.tabBarItem.title = "Collection"
        
        let space:CGFloat = 3.0
        
        let orientation = UIDevice.current.orientation
        
        let dimension = UIDeviceOrientation.portrait == orientation ? ((view.frame.size.width - (2 * space)) / 3.0) : ((view.frame.size.height - (2 * space)) / 3.0)
        
        flowlayout.minimumInteritemSpacing = space
        
        flowlayout.minimumLineSpacing = space
        
        flowlayout.itemSize = CGSize(width: dimension, height: dimension)
        
        // Uncomment the following line to preserve selection between presentations
        
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    @objc func upload(){
        
        let uploadVC = storyboard?.instantiateViewController(withIdentifier: "MemePopUpView") as! ViewController
        
        uploadVC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(uploadVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memelist.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Meme2CVCollectionViewCell
        
        if (memelist.count > 0) {
            
            let meme = memelist[indexPath.row]
            
            cell.memeImage?.image = meme.fullmemeImage
            
        }
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let DViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeD") as! Meme2DViewController
        
        DViewController.MemeD = memelist[indexPath.row]
        
        DViewController.hidesBottomBarWhenPushed = true
                // push so that we can go back
        self.navigationController!.pushViewController(DViewController, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
