//
//  RankingRequestManager.swift
//  DemoFirebaseForGOWranking
//
//  Created by Nikolay Raychev on 1.12.18.
//  Copyright © 2018 DemoFirebaseForGOWranking/GameOfVerbs/com.theXcoder. All rights reserved.
//

import Foundation

class RankingRequestManager {
    class func addRanking(ranking: Ranking) {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         FirebaseWordOfVerbsWrite (PUT https://gameofwords-1.firebaseio.com/ranking/date14.json)
         */
        

        guard let URL = URL(string: "https://gameofwords-1.firebaseio.com/ranking/\(ranking.id).json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        // Headers
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // JSON Body
        
        let bodyObject: [String : String] = [
            "username": ranking.username,
            "points": ranking.points
            
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    class func getData(){
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         FirebaseWordOfVerbsRead (GET https://gameofwords-1.firebaseio.com/ranking.json)
         */
        
        guard let URL = URL(string: "https://gameofwords-1.firebaseio.com/ranking.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
            
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : [String: String]]
//                    print(json)
                    for line in json {
                        print(line.key)
                        print(line.value)
                        guard line.value["username"] != nil, line.value["points"] != nil else {
                            return
                        }
//                        RankingManager.receiveFromFireBaseRankings(ranking: Ranking.init(id: line.key, username: line.value["username"]!, points: line.value["points"]!))
                        RankingManager.addToReceiveFromFireBase(ranking: Ranking.init(id: line.key, username: line.value["username"]!, points: line.value["points"]!))
                    }
                    
                } catch {
                }
                
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
        return
    }
}
