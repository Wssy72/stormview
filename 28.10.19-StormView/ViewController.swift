//
//  ViewController.swift
//  28.10.19-StormView
//
//  Created by Sergey on 28/10/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]() //«this is array a pictures to load!»
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm View"
        
    navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        // this is path with folder
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        let sortUpPictures = pictures.sorted(by: <)
        pictures = sortUpPictures
        print(pictures)
        
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
    override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // set its selected Image
            vc.selectImage = pictures[indexPath.row]
            vc.selectImageNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            
            // now push navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
}
