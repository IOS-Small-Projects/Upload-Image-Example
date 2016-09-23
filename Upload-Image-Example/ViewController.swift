//
//  ViewController.swift
//  Upload-Image-Example
//
//  Created by Rohit on 23/09/16.
//  Copyright © 2016 Introp. All rights reserved.
//
import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    func imageTapped(img: AnyObject)
    {
        
        let dialog = UIAlertController(title: "Choose profile image", message: "", preferredStyle: .Alert)
        
        
        dialog.addAction(UIAlertAction(title: "Camera", style: .Default) { _ in
            self.uploadImage("Camera")
            })
        
        dialog.addAction(UIAlertAction(title: "Gallary", style: .Default) { _ in
            self.uploadImage("Gallary")
            })
        
        dialog.addAction(UIAlertAction(title: "Cancel", style: .Default) { _ in
            self.uploadImage("Cancel")
            })
       
        self.presentViewController(dialog, animated: true){}
    }
    
    func uploadImage(type: String){
        
        switch type {
        case "Camera":
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
            break
            
        case "Gallary":
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
            break
            
        case "Cancel":
            break
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
                super.viewDidLoad()
                let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ViewController.imageTapped(_:)))
                imageView.userInteractionEnabled = true
                imageView.addGestureRecognizer(tapGestureRecognizer)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        imageView.image = image

    }
    
    
    
    
    
}

