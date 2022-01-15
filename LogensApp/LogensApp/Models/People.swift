//
//  People.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import Foundation

class Topic {
    
    var name: String
    var bio: String
    var videos: [Video]

    init(name: String, bio: String, videos: [Video]) {
        self.name = name
        self.bio = bio
        self.videos = videos
    }
}

class Video {
    
    var videoName: String
    var videoDescription: String
    
    init(videoName: String, videoDescription: String) {
        self.videoName = videoName
        self.videoDescription = videoDescription
    }
}
