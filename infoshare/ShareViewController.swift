//
//  ShareViewController.swift
//  infoshare
//
//  Created by Eriko Ichinohe on 2016/09/19.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        
        var inputItem : NSExtensionItem = self.extensionContext!.inputItems[0] as! NSExtensionItem
        var outputItem : NSExtensionItem = inputItem.copy() as! NSExtensionItem;
        
        // 入力されたテキストを設定する
        outputItem.attributedContentText = NSAttributedString(string:self.contentText, attributes:nil);
        
        
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first as? NSItemProvider {
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
                        if let shareURL = url as? NSURL {
                            // send url to server to share the link
                            print(shareURL)
                            
                            //ユーザーデフォルトを用意する
                            let myDefault = UserDefaults(suiteName: "group.com.eshare")
                            
                            //データを書き込んで
                            myDefault?.set(shareURL.absoluteString, forKey: "myUrl")
                            
                            //即反映させる
                            myDefault?.synchronize()

                        }
                        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
                    })
                }
            }
        }
        
//        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
