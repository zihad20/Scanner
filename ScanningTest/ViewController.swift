//
//  ViewController.swift
//  ScanningTest
//
//  Created by Zihad on 08/06/2020.
//  Copyright © 2020 MatrixTeam. All rights reserved.
//

import UIKit
import Vision
import VisionKit

class ViewController: UIViewController {
    @IBOutlet weak var scanImageView: UIImageView!
    @IBOutlet weak var ocrTextView: UITextView!
    @IBOutlet weak var scanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure(){
        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
    }
    @objc private func scanDocument() {
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
}

extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        scanImageView.image = scan.imageOfPage(at: 0)
        // Here will be the code for text recognition
 
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        //Handle properly error
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}

