//
//  Meme2.swift
//  Meme1.0
//
//  Created by Manish raj(MR) on 11/10/21.
//

import UIKit

class Meme2: UITableViewController {
    
    let memelist = PopMeme2.memelist


    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return memelist.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Meme2Cell", for: indexPath)
        
        let meme = memelist[indexPath.row]
        
        cell.imageView?.image = meme.fullmemeImage
                
        cell.textLabel?.text = ("\(meme.upperText!)...\(meme.bottomText!)")
            
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
                
        cell.accessibilityLabel? = "label"
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeD") as! Meme2DViewController
        
        DViewController.MemeD = memelist[indexPath.row]
        
        DViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController!.pushViewController(DViewController, animated: true)
        
    }
    
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        navigationItem.title = "Sent Meme"
        let tabItems = self.tabBarController?.tabBar.items
        tabItems?[0].image = UIImage(named: "table")
        tabItems?[0].title = "Table"
               
        tabItems?[1].image = UIImage(named: "collection")
        tabItems?[1].title = "Collection"
               
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(upload))
               
        navigationItem.rightBarButtonItem?.isEnabled = true
        
    }
    
   @objc func upload() {
       
       let uploadVC = storyboard?.instantiateViewController(withIdentifier: "memeCreateView") as! ViewController
        uploadVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(uploadVC, animated: true)
    
   }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
