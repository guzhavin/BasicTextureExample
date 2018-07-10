import UIKit
import AsyncDisplayKit

class SonicAndFirendsGalleryViewController: ASViewController<ASScrollNode>  {
    init() {
        super.init(node: GalleryScrollNode())
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(node: ASScrollNode.init())
    }
}

class GalleryScrollNode: ASScrollNode {
    
    override required init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        self.automaticallyManagesSubnodes = true
        self.automaticallyManagesContentSize = true
        
        self.layoutSpecBlock = { node, constrainedSize in
            let stack = ASStackLayoutSpec.vertical()
            stack.alignContent = .center;
            stack.alignItems = .center;
            
            let urls = [
                "https://pbs.twimg.com/media/DbowangU8AAWsIj.jpg",
                "https://www-sonicthehedgehog-com-content.s3.amazonaws.com/stage/homepage-teaser-mobile_2.jpg",
                "http://images.nintendolife.com/news/2017/08/video_check_out_the_opening_cinematic_for_sonic_mania/attachment/0/large.jpg",
                "https://assets.wired.com/photos/w_1720/wp-content/uploads/2015/02/sonic-ft.jpg",
                "https://small-games.info/s/f/s/sonic_the_hedgehog_4_episode_1_2.jpg",
                "http://data.apkapp.ru/uploads/posts/2013-12/1387457087_sonic-the-hedgehog-2-1.png",
                "https://omegaunderground.com/wp-content/uploads/2018/03/SONIC-THE-HEDGEHOG_ATLANTA_JULY_PARAMOUNT_BLUR-STUDIO_.jpg",
                "http://imperiya.by/image/cSgp-DIrCXr.jpg",
                "https://rampaga.ru/_sf/138/15863895.jpg",
                "https://cdn.vox-cdn.com/thumbor/XYU7n6jqUA5rh8oXAOaUNZi4JoU=/0x0:1100x619/1200x800/filters:focal(462x222:638x398)/cdn.vox-cdn.com/uploads/chorus_image/image/58762373/sonic.0.0.jpg",
                "https://41zxbw463fq733z1kl101n01-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/sonic-generations-1124-025.jpg",
                "http://shootthebreezecomics.com/wp-content/uploads/2018/04/NEWS-template-7.jpg",
                "https://static1.srcdn.com/wordpress/wp-content/uploads/2018/02/Sonic-the-Hedgehog-video-game.jpg",
                "https://geekculture.co/wp-content/uploads/2018/03/puma-sega-sonic-shoe-collaboration-featured.jpg",
                "https://i.kinja-img.com/gawker-media/image/upload/s--sEMog84o--/c_scale,f_auto,fl_progressive,q_80,w_800/nvn8zb9c0pbvoy8ks5p7.jpg",
                "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_3ds_download_software_7/SI_3DSDS_3DSonicTheHedgehog_image1600w.jpg"]
            
            var imageNodes: [ASNetworkImageNode] = [];
            
            for url in urls {
                let imageNode = ASNetworkImageNode()
                imageNode.url = URL(string: url)
                imageNode.shouldRenderProgressImages = true;
                imageNode.style.preferredSize = CGSize(width: 300, height: 300)
                imageNode.contentMode = UIViewContentMode.scaleAspectFit;
                
                imageNodes.append(imageNode)
            }
            
            stack.children = imageNodes
            
            return stack
        }
    }
}



