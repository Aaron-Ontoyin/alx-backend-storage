#!/usr/bin/env python3
""" Log stats """
from pymongo import MongoClient


def log_stats(mongo_collection):
    """ Provides some stats about Nginx logs stored in MongoDB """
    print("{} logs".format(mongo_collection.count_documents({})))

    print("Methods:")
    for method in ["GET", "POST", "PUT", "PATCH", "DELETE"]:
        count = mongo_collection.count_documents({"method": method})
        print("\tmethod {}: {}".format(method, count))

    print("{} status check".format(mongo_collection.count_documents({"method": "GET", "path": "/status"})))

    # Top 10 IPs
    top_ips = mongo_collection.aggregate([
        {"$group": {
            "_id": "$ip",
            "count": {"$sum": 1}
        }},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ])

    print("IPs:")
    for ip in top_ips:
        print("\t{}: {}".format(ip["_id"], ip["count"]))

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs_collection = client.logs.nginx
    log_stats(logs_collection)
