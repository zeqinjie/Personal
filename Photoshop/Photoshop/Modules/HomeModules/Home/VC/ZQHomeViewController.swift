//
//  HomeViewController.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/18.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit
import CropViewController
class ZQHomeViewController: BaseViewController, CropViewControllerDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseBtn: UIButton!
    fileprivate var image: UIImage?
    fileprivate var croppingStyle = CropViewCroppingStyle.default
    
    fileprivate var croppedRect = CGRect.zero
    fileprivate var croppedAngle = 0
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
    }
    
    override func defaultSet() {
        super.defaultSet()
        self.isHideNavigationBar = true
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    // MARK: - Action
    @IBAction func chooseAction(_ sender: UIButton) {
        self.croppingStyle = .default
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    public func updateImageViewWithImage(_ image: UIImage, fromCropViewController cropViewController: CropViewController) {
        imageView.image = image
        layoutImageView()
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        if cropViewController.croppingStyle != .circular {
            imageView.isHidden = true
            
            cropViewController.dismissAnimatedFrom(self, withCroppedImage: image,
                                                   toView: imageView,
                                                   toFrame: CGRect.zero,
                                                   setup: { self.layoutImageView() },
                                                   completion: { self.imageView.isHidden = false })
        }
        else {
            self.imageView.isHidden = false
            cropViewController.dismiss(animated: true, completion: nil)
        }
    }
}

extension ZQHomeViewController {
    fileprivate func creatUI() {
        self.chooseBtn.layer.borderColor = ZQColor_563885?.cgColor
        self.chooseBtn.layer.cornerRadius = 0.5 * self.chooseBtn.frame.width
        self.chooseBtn.layer.borderWidth = 8
    }
    
    public func layoutImageView() {
        ZQTool.layoutImageView(imageView: self.imageView, contentView: self.contentView, padding: 5)
    }
    
    
}

extension ZQHomeViewController {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        guard let image = (info[UIImagePickerControllerOriginalImage] as? UIImage) else { return }
        
        let cropController = CropViewController(croppingStyle: croppingStyle, image: image)
        cropController.delegate = self
        
        self.image = image
        
        //If profile picture, push onto the same navigation stack
        if croppingStyle == .circular {
            if picker.sourceType == .camera {
                picker.dismiss(animated: true, completion: {
                    self.present(cropController, animated: true, completion: nil)
                })
            } else {
                picker.pushViewController(cropController, animated: true)
            }
        }
        else { //otherwise dismiss, and then present from the main controller
            picker.dismiss(animated: true, completion: {
                self.present(cropController, animated: true, completion: nil)
                //self.navigationController!.pushViewController(cropController, animated: true)
            })
        }
    }
    
    public func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.croppedRect = cropRect
        self.croppedAngle = angle
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
    
    public func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.croppedRect = cropRect
        self.croppedAngle = angle
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
}

