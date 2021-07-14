//
//  CollectionViewLayout.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

public class HomeFlowLayout:UICollectionViewLayout
{
    var columnCount: Int = 3 {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    var itemHeight: CGFloat = 0.0
    var itemWidth: CGFloat = 0.0
    var margin: CGFloat = 2
    
    public override func prepare() {
        super.prepare()
        
        itemWidth = ((self.collectionView?.frame.width ?? 0.0) )/3
        itemHeight = 100//((self.collectionView?.frame.height ?? 0.0) - 260)/4
        
        collectionView?.isScrollEnabled = true
    }
    public override var collectionViewContentSize : CGSize {
        
        var width: CGFloat = 0
        
       //let pageNumber = (collectionView!.numberOfItems(inSection: 0)-1) / (columnCount*2) + 1
        width = CGFloat(collectionView!.bounds.width)//CGFloat(collectionView!.bounds.width * CGFloat(pageNumber))
        return CGSize(width: width, height: collectionView!.bounds.height)
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView!.numberOfItems(inSection: 0)
        for i in 0..<cellCount {
            let indexPath =  IndexPath(item:i, section:0)
            
            let attributes =  self.layoutAttributesForItem(at: indexPath)
            
            attributesArray.append(attributes!)
            
        }
        return attributesArray
    }
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        //let page = indexPath.item / (columnCount*4)
        let row = indexPath.item % (columnCount*4) / columnCount  //理解这样写很关键
        
        let column = indexPath.item % (columnCount*4) % columnCount //+ page * 3 //理解这样写很关键
        
        //let gap = (collectionView!.bounds.width - itemWidth*3)/4.0
        
        let positionX =  CGFloat(column) * itemWidth//(itemWidth + gap) + margin*(CGFloat(page + 1)) //理解这样写很关键
        
        let positionY = CGFloat(row) * itemHeight//(itemHeight + gap)  //+ 2
        
        attribute.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        
        return attribute
    }
}
