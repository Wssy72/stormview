//
//  DetailViewController.swift
//  28.10.19-StormView
//
//  Created by Sergey on 31/10/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectImage: String?
    var selectImageNumber = 0 //+
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectImage
        title = "Picture \(selectImageNumber) of \(totalPictures)"
        // в строке заголовка детализации, покажите Picture X of Y, а X - позиция выбранного изображения в массиве и Y - общее количество изображений, . print(Picture x индекс of y pictures.count)
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        // Do any additional setup after loading the view.
    }
    // hiades bar or show bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
 
    
    //  title = indexAndCountPicrures
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
