#!/usr/bin/env python3
""" Module for finding schools with a specific topic """

def schools_by_topic(mongo_collection, topic):
    """ Returns the list of school having a specific topic """
    
    schools = mongo_collection.find({"topics": topic})
    
    return list(schools)
