import Foundation
import UIKit
import AsyncDisplayKit

class FriendPageViewController: ASViewController<ASDisplayNode>  {
    init(url: String, name: String) {
        super.init(node: FriendNode(url: url, name: name))
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(node: ASDisplayNode.init())
    }
}

class FriendNode: ASDisplayNode {
    var url: String
    var name: String
    override required init() {
        self.url = ""
        self.name = ""
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
    init(url: String, name: String) {
        self.url = url
        self.name = name
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
}

extension FriendNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let someVerticalStack = ASStackLayoutSpec.vertical()
        someVerticalStack.style.flexShrink = 1.0
        someVerticalStack.style.flexGrow = 1.0
        someVerticalStack.style.alignSelf = .center;
        
        let textNode = ASTextNode()
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attrs = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSAttributedStringKey.paragraphStyle: paragraph ]
        let string = NSAttributedString(string: self.name, attributes: attrs)
        textNode.attributedText = string
        textNode.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        let imageNode = ASNetworkImageNode()
        imageNode.url = URL(string: self.url)
        imageNode.style.preferredSize = CGSize(width: 300, height: 300)
        imageNode.contentMode = UIViewContentMode.scaleAspectFit;
        
        /*let nodeControl = ASDisplayNode { () -> UIPageControl in
            let dots = UIPageControl();
            dots.numberOfPages = 2;
            dots.currentPage = 1;
            var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
            dots.pageIndicatorTintColor = UIColor.red
            return dots
        }*/

        someVerticalStack.children = [textNode, imageNode]
        
        let someVerticalStackSpec = ASStackLayoutSpec(direction: .vertical,
                                                      spacing: 40,
                                                      justifyContent: .start,
                                                      alignItems: .center,
                                                      children: [someVerticalStack])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10), child: someVerticalStackSpec)
    }
}
