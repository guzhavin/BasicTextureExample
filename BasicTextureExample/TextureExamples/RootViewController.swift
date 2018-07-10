import UIKit
import AsyncDisplayKit

class RootViewController: ASTabBarController  {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let SonicTab = SonicPictureViewController()
        let SonicTabBarItem = UITabBarItem(title: "Sonic", image: UIImage(named: "contact"), selectedImage: UIImage(named: "contact"))
        SonicTab.tabBarItem = SonicTabBarItem
        
        let SonicFriendsTab = SonicFriendsPagerViewController()
        let SonicFriendsBarItem = UITabBarItem(title: "His friends", image: UIImage(named: "contacts"), selectedImage: UIImage(named: "contacts"))
        SonicFriendsTab.tabBarItem = SonicFriendsBarItem
        
        let SonicAndFriendsGalleryTab = SonicAndFirendsGalleryViewController()
        let tabThreeBarItem = UITabBarItem(title: "Together!", image: UIImage(named: "albums"), selectedImage: UIImage(named: "albums"))
        SonicAndFriendsGalleryTab.tabBarItem = tabThreeBarItem
        
        self.viewControllers = [SonicTab, SonicFriendsTab, SonicAndFriendsGalleryTab]
    }
}


