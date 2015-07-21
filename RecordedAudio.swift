//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Asim Abdul on 7/19/15.
//  Copyright (c) 2015 AsimAbdul. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var fileURL:NSURL!
    var title: String!
    
    init(fileURL: NSURL!, title: String!) {
        self.fileURL = fileURL
        self.title = title
    }
}
