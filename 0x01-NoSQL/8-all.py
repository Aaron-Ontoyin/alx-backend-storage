#!/usr/bin/env python3
""" Module for retrieving all documents from a pymongo collection """

def list_all(mongo_collection):
    """ Lists all documents in a collection """
    documents = []
    
    # Use find() without any parameters to retrieve all documents
    cursor = mongo_collection.find()
    
    for document in cursor:
        documents.append(document)
        
    return documents
