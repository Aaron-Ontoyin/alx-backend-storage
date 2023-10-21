#!/usr/bin/env python3
"""Redis: Python: ALX Exercises"""

import redis
import uuid
from typing import Union


class Cache:
    def __init__(self):
        # Create a Redis client instance
        self._redis = redis.Redis()
        
        # Flush the database
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        # Generate a random key using uuid
        key = str(uuid.uuid4())
        
        # Store the input data in Redis using the random key
        self._redis.set(key, data)
        
        return key
