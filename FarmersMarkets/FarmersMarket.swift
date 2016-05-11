//
//  FarmersMarket.swift
//  FarmersMarkets
//
//  Created by Alexander Sramek on 5/11/16.
//  Copyright © 2016 MostlyDiff. All rights reserved.
//

import Foundation

func mGetNestedStringFromJSON(data: JSONDictionary, first: String, second: String) -> String
{
    if let firstDict = data[first] as? JSONDictionary,
        nameString = firstDict[second] as? String
    {
        return nameString
    }
    else
    {
        return ""
    }
}

func mGetStringFromJSON(data: JSONDictionary, name: String) -> String
{
    if let nameString = data[name] as? String
    {
        return nameString
    }
    else
    {
        return ""
    }
}


class FarmersMarket
{
    
    private var _fName: String
    private var _fLocation: String
    private var _fStreet: String
    private var _fCity: String
    private var _fCounty: String
    private var _fState: String
    private var _fZip: String
    private var _fLatitude: String
    private var _fLongitude: String
    private var _fHours: String
    private var _fSeason: String
    private var _fMonths: String
    private var _fContactName: String
    private var _fContactPhone: String
    private var _fLink: String
    
    var fName: String{
        return _fName
    }
    
    var fLocation: String{
        return _fLocation
    }
    
    var fCounty: String{
        return _fCounty
    }
    
    var fLink: String{
        return _fLink
    }
    
    init(data: JSONDictionary)
    {
        
            //First pass at getting data. Right now I put it all into strings. Later, some variables will
            //  probably change to numbers and calendars.
        _fName = mGetStringFromJSON(data, name: "market_name")
        _fLocation = mGetStringFromJSON(data, name: "location")
        _fStreet = mGetStringFromJSON(data, name: "address_line_1")
        _fCity = mGetStringFromJSON(data, name: "city")
        _fCounty = mGetStringFromJSON(data, name: "county")
        _fState = mGetStringFromJSON(data, name: "state")
        _fZip = mGetStringFromJSON(data, name: "zip")
        _fLatitude = mGetStringFromJSON(data, name: "latitude")
        _fLongitude = mGetStringFromJSON(data, name: "longitude")
        _fHours = mGetStringFromJSON(data, name: "operation_hours")
        _fSeason = mGetStringFromJSON(data, name: "operation_season")
        _fMonths = mGetStringFromJSON(data, name: "operation_months_code")
        _fContactName = mGetStringFromJSON(data, name: "contact")
        _fContactPhone = mGetStringFromJSON(data, name: "phone")
        _fLink = mGetNestedStringFromJSON(data, first: "market_link", second: "url")
        
    }
    

    
    //We'll need to parse the dates and times into a structure. Possibly multiple instances of the structure in one class.
    //Some are crunchy, like this: Mon-Fri  11am-6pm, Sat/Sun  10am-2pm
    
    
    //market name
    //location string
    //street address
    //city
    //county
    //state
    //long
    //lat
    //dates open
    //hours open
    //link
    //contact name
    //contact phone
    //fmnp
    //snap
    /*
    "market_name" : "Veggie Mobile-Thurlow Terrace",
    "zip" : "12203",
    "phone" : "5182748685",
    "operation_hours" : "Wed 12pm-1pm",
    "location" : "2 Thurlow Terrace Albany",
    "location_points" : {
    "needs_recoding" : false,
    "longitude" : "-73.77248",
    "latitude" : "42.66032"
    },
    "state" : "NY",
    "market_link" : {
    "url" : "http://www.capitalroots.org"
    },
    "contact" : "Will Malcolm",
    "operation_months_code" : "YR",
    "city" : "Albany",
    "address_line_1" : "2 Thurlow Terrace",
    "county" : "Albany",
    "fmnp" : "Y",
    "operation_season" : "Year-round",
    "longitude" : "-73.77248",
    "latitude" : "42.66032",
    "snap_status" : "Y"
 */
}