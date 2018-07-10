import UIKit
import AsyncDisplayKit

class SonicPictureViewController: ASViewController<ASDisplayNode>  {
    
    init() {
        super.init(node: SonicPictureNode())
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(node: ASDisplayNode.init())
    }
}

class SonicPictureNode: ASDisplayNode {
    
    override required init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
    public func SomeView() -> UIView {
        let newUIView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let segmentedView = UISegmentedControl(items: ["Watchlist", "Following"])
        newUIView.addSubview(segmentedView)
        return newUIView
    }
    
}

extension SonicPictureNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let someVerticalStack = ASStackLayoutSpec.vertical()
        someVerticalStack.style.flexShrink = 1.0
        someVerticalStack.style.flexGrow = 1.0
        someVerticalStack.style.alignSelf = .center;
        
        let textNode = ASTextNode()
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attrs = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSAttributedStringKey.paragraphStyle: paragraph ]
        let string = NSAttributedString(string: "Sonic the Hedgehog!", attributes: attrs)
        textNode.attributedText = string
        textNode.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        let imageNode = ASNetworkImageNode()
        imageNode.url = URL(string: "https://vignette.wikia.nocookie.net/sonic/images/9/92/A_picture_of_Sonic_from_the_Sonic_website.png/revision/latest?cb=20170716190435")
        imageNode.style.preferredSize = CGSize(width: 300, height: 300)
        imageNode.contentMode = UIViewContentMode.scaleAspectFit;
        
        someVerticalStack.children = [textNode, imageNode]
        
        let someVerticalStackSpec = ASStackLayoutSpec(direction: .vertical,
                                                      spacing: 40,
                                                      
                                                      justifyContent: .start,
                                                      alignItems: .center,
                                                      children: [someVerticalStack])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10), child: someVerticalStackSpec)
    }
}

