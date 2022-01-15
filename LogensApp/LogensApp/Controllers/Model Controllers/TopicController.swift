//
//  PersonController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import Foundation

class TopicController {
    
    static let topics =
    [
        Topic(
            name: "Steering Techniques",
            bio: "5 Videos",
            videos: [
                Video(
                    videoName: "Earth Planer",
                    videoDescription: "Turtle"
                ),
                Video(
                    videoName: "Their PS5",
                    videoDescription: "Turtle"
                ),
                Video(
                    videoName: "Their Dog",
                    videoDescription: "Turtle"
                ),
                Video(
                    videoName: "Their Other Dog",
                    videoDescription: "Turtle"
                ),
                Video(
                    videoName: "Their mom",
                    videoDescription: "Turtle"
                )
            ]
        ),
        
        Topic(name: "Braking Techniques", bio: "3 Videos", videos: [Video(videoName: "Larisssa", videoDescription: "Larissa")]),
        
        Topic(name: "Conering Techniques", bio: "5 Videos", videos: [Video(videoName: "Debbie", videoDescription: "Cat")]),
        
        Topic(name: "Defensive Driving", bio: "6 Videos ", videos: [Video(videoName: "Boys", videoDescription: "Fish")])]
    
}




