//
//  ViewController.swift
//  TableViewBasic
//
//  Created by BJIT on 25/9/23.
//

import UIKit
import RxSwift
import RxCocoa


struct Food {
    var foodName : String
    var foodImage : String
    
    init(foodName: String, foodImage: String) {
        self.foodName = foodName
        self.foodImage = foodImage
    }
}

class ViewController: UIViewController , UITableViewDelegate {
    
    
    var tableViewItems =  Observable.just( [
        
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer"),
        
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer"),
        
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer"),
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer"),
        
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer"),
        
        Food.init(foodName: "Hamburger", foodImage: "Hamburger"),
        Food.init(foodName: "Coke", foodImage: "Coke"),
        Food.init(foodName: "Fries", foodImage: "Fries"),
        Food.init(foodName: "Beer", foodImage: "Beer")
        
    ] )
    
    let disposeBag = DisposeBag()
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.homeTableView.delegate = self
        
        
        
     
       
        // Data binding and  load in tableView
        self.tableViewItems.bind(to: self.homeTableView
            .rx
            .items(cellIdentifier: "HomeTableViewCell" , cellType: HomeTableViewCell.self)){
                (tableView , tableViewItems , cell) in
                
                cell.FoodName.text = tableViewItems.foodName
                cell.foodImageView.image = UIImage(named: tableViewItems.foodImage)
                
            }.disposed(by: self.disposeBag)
        
        
        
        // select data model
        self.homeTableView.rx.modelSelected(Food.self).subscribe(onNext: { foodObject in
                print("Selected Item - ",foodObject.foodName)
                
            }).disposed(by: self.disposeBag)
        
        
    // item selection using IndexPath
        self.homeTableView.rx.itemSelected.subscribe(onNext: { indexpath in
                
                print("indexPath " , indexpath.row)
                
            })
            .disposed(by: self.disposeBag)
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176.0
    }
    
}

