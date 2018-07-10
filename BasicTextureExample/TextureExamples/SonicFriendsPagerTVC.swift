import UIKit
import AsyncDisplayKit

class SonicFriendsPagerViewController: ASViewController<ASPagerNode>, ASCollectionDataSource  {
    let pagerNode = ASPagerNode()
    
    init() {
        super.init(node: pagerNode)
        node.dataSource = self as ASCollectionDataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SonicFriendsPagerViewController: ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return 2
    }
    
    func pagerNode(_ pagerNode: ASPagerNode, nodeAt index: Int) -> ASCellNode {
        let customView = UIView()
        customView.frame = UIScreen.main.bounds
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
        nameLabel.text = "Index is: \(index)"
        nameLabel.textColor = UIColor.black
        customView.addSubview(nameLabel)
        
        let node = ASCellNode { () -> UIView in
            return customView
        }
        
        node.style.preferredSize = pagerNode.bounds.size
        
        let url = index == 0 ? "https://vignette.wikia.nocookie.net/sonic/images/9/9f/Main_knuckles.png/revision/latest?cb=20171025045929" :
        "https://vignette.wikia.nocookie.net/sonic/images/2/29/Main_tails.png/revision/latest?cb=20171029043015"
        let name = index == 0 ? "Knuckles the Echidna" :
        "Tails the Fox"
        
        let nd = ASCellNode( viewControllerBlock: { () -> ASViewController<ASDisplayNode> in
            return FriendPageViewController(url: url, name: name)
        })
        
        return nd
    }
}



