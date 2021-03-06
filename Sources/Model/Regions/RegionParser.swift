////
///  RegionParser.swift
//

import SwiftyJSON

public struct RegionParser {

    public static func regions(key: String, json: JSON, isRepostContent: Bool = false) -> [Regionable] {
        if let content = json[key].object as? [[String: AnyObject]] {
            return content.map { (contentDict) -> Regionable in
                let kind = RegionKind(rawValue: contentDict["kind"] as! String) ?? RegionKind.Unknown
                let regionable: Regionable
                switch kind {
                case .Text:
                    regionable = TextRegion.fromJSON(contentDict) as! TextRegion
                case .Image, .AffiliateImage:
                    regionable = ImageRegion.fromJSON(contentDict) as! ImageRegion
                case .Embed:
                    regionable = EmbedRegion.fromJSON(contentDict) as! EmbedRegion
                default:
                    regionable = UnknownRegion(name: "Unknown")
                }
                regionable.isRepost = isRepostContent
                return regionable
            }
        }
        else {
            return []
        }
    }
}
