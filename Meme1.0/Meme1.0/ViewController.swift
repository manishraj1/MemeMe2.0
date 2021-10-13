//
//  ViewController.swift
//  Meme1.0
//
//  Created by Manish raj(MR) on 27/08/21.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate, UITextFieldDelegate{

    @IBOutlet weak var ImagePickerView: UIImageView!
    
    @IBOutlet weak var pickAnImageFromCamera: UIBarButtonItem!
    
    @IBOutlet weak var TopText: UITextField!
    
    @IBOutlet weak var BottomText: UITextField!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var cancleButton: UIBarButtonItem!
    
    var editMeme:PopMeme2?
    
    var memeImage: UIImage?
    
    var editMode:Bool = false
        
    var originalViewHight:CGFloat = 0
    
    var imagePicker = UIImagePickerController()
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth: -3
        
    ]
    
    struct Meme {

        let topText: String
        let bottomText: String
        let originalImage: UIImage
        let memedImage: UIImage
    }
    
    func save() {
            // Create the meme
        _ = Meme(topText: TopText.text!, bottomText: BottomText.text!, originalImage: ImagePickerView.image!, memedImage: generateMemedImage())
        
    }
    
    
    func generateMemedImage() -> UIImage {
        
        toolbar.isHidden = true
        toolBar.isHidden = true

        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        toolbar.isHidden = false
        toolBar.isHidden = false

        return memedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            ImagePickerView.image = image
            picker.dismiss(animated: true, completion: nil)
        
        }
        
        dismiss(animated: true, completion: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        
    }
    
    func subscribeToKeyboardNotifications() {

           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    func unsubscribeFromKeyboardNotifications() {

           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
       
    @objc func keyboardWillShow(_ notification:Notification) {
           
               if TopText.isFirstResponder == false {
           
                view.frame.origin.y = -getKeyboardHeight(notification)
       
               }
           
    }
       
    @objc func keyboardWillHide(_ notification:NSNotification) {
           
           if BottomText.isFirstResponder{
               
               view.frame.origin.y = 0
               
           }
    }

    func getKeyboardHeight(_ notification:Notification) -> CGFloat {

           let userInfo = notification.userInfo
           let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
           return keyboardSize.cgRectValue.height
    }
       
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
           return textField.resignFirstResponder()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        imagePicker.delegate = self
        TopText.delegate = self
        BottomText.delegate = self
        TopText.defaultTextAttributes = memeTextAttributes
        BottomText.defaultTextAttributes = memeTextAttributes
        self.TopText.textAlignment = .center
        self.BottomText.textAlignment = .center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PickanImage(_ sender: Any){
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        let imagePicker = UIImagePickerController()
        present(imagePicker, animated: true, completion: nil)
        let pickerController = UIImagePickerController()
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let memed = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [memed], applicationActivities: nil)
        self.present(controller, animated: true, completion:nil )
        controller.completionWithItemsHandler = { (activity, success, items, error) in
            if(success) {
                self.save()
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        shareButton.isEnabled = false
        ImagePickerView.image = nil
        TopText.text = "TOP"
        BottomText.text = "BOTTOM"
    }
    
}

