#!/usr/bin/env python3
""" Module for inserting a document into a pymongo collection """

def insert_school(mongo_collection, **kwargs):
    """ Inserts a new document in a collection based on kwargs """
    
    # Insert the document and get the InsertOneResult object
    result = mongo_collection.insert_one(kwargs)
    
    # Return the _id of the inserted document
    return result.inserted_id
