//
//  APIManager.swift
//  FarmersMarkets
//
//  Created by Alexander Sramek on 5/11/16.
//  Copyright © 2016 MostlyDiff. All rights reserved.
//

import Foundation

class APIManager
{
    func mLoadMarkets(urlString: String, completion: [FarmersMarket] -> Void)
    {
            //Set up the URL loading session
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let url = NSURL(string: urlString)!
        
            //Prepare a task to send to the URL fetcher
        let task = session.dataTaskWithURL(url)
        {(data, response, error) -> Void in
            
                //If there was an error, print the error
            if(error != nil)
            {
                print(error!.localizedDescription)
            }
            else    //no error, keep on keeping on
            {
                
                do
                {
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONArray
                    {
                        var markets = [FarmersMarket]()
                        
                        for entry in json
                        {
                            let entry = FarmersMarket(data: entry as! JSONDictionary)
                        }
                    }
                    
                    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                    
                    dispatch_async(dispatch_get_global_queue(priority, 0))
                    {
                        dispatch_async(dispatch_get_main_queue())
                        {
                            completion(markets)
                        }
                    }
                    
                }
                catch
                {
                    print("Error in Farmers Market json")
                }
            }
            
        }//end task block
        
            //Set the task out into the wild to run in its own merry time
        task.resume()
    }
}