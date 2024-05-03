//
//  ViewController.swift
//  CryptaI
//
//  Created by FFK on 1.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        changeColor(itemAppearance: UITabBarItemAppearance())
    }
    /*
     FONKSİYON İSMİNİ DEĞİŞTİR
     */
    
    private func setupTabBar(){
            let appearanceTabBar = UITabBarAppearance()
            appearanceTabBar.backgroundColor = UIColor.background

            changeColor(itemAppearance: appearanceTabBar.stackedLayoutAppearance)
            changeColor(itemAppearance: appearanceTabBar.inlineLayoutAppearance)
            changeColor(itemAppearance: appearanceTabBar.compactInlineLayoutAppearance)

            tabBarController?.tabBar.standardAppearance = appearanceTabBar
            tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar
        }

        private func changeColor(itemAppearance: UITabBarItemAppearance){
            itemAppearance.selected.iconColor = UIColor.purplee
            itemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.purplee]
            //Unselected
            itemAppearance.normal.iconColor = UIColor.white
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
}

