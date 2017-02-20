//
//  ContactViewController.swift
//  Auto Stop Race
//
//  Created by Robert Ignasiak on 18.02.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol ContactViewControllerDelegate : class {
    func contactSelected(contact: Contact)
}

class ContactViewController: UIViewControllerWithMenu,  UICollectionViewDelegateFlowLayout {
    
    let cellHeight: CGFloat = 80
    var viewModel: ContactViewModel!
    
    let disposeBag = DisposeBag()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    convenience init(viewModel: ContactViewModel) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle()
        setupCollectionView()
        
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.Identifier)

        viewModel.contacts
            .bindTo(collectionView.rx.items(cellIdentifier: ContactCell.Identifier, cellType:ContactCell.self)) { row, contact, cell in
                cell.contact = contact
            }
            .addDisposableTo(disposeBag)
        
        collectionView.rx.itemSelected
            .bindTo(viewModel.itemSelected).addDisposableTo(disposeBag)
        
        collectionView.rx.modelSelected(Contact.self)
            .subscribe(onNext: { menu in
                
            })
            .addDisposableTo(disposeBag)
        
        collectionView.rx.setDelegate(self).addDisposableTo(disposeBag)
        
    }

    func setupNavigationBarTitle() {
        let titleLabel = navigationItem.titleView as! UILabel
        titleLabel.text = NSLocalizedString("title_contact", comment: "")
    }

    func setupCollectionView() {
        let image = UIImage(named: "img_team_asr")?.scaled(toWidth: view.bounds.width)
        
        let backgroundImage = UIImageView(frame: CGRect.init(origin: .zero, size: image!.size))
        backgroundImage.image = image
        
        collectionView.backgroundColor = UIColor.white

        view.addSubview(backgroundImage)
        view.addSubview(collectionView)
        
        backgroundImage.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(view)
        }
        
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backgroundImage.snp.bottom)
            make.left.bottom.right.equalTo(view)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: 100)
    }
}
