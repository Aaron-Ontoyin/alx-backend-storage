#!/usr/bin/env python3
"""Redis: Python: ALX Exercises"""

import redis
import requests
from functools import wraps

r = redis.Redis()


def count_url_accesses(func: Callable) -> Callable:
    """Decorator to count the number of times a particular URL was accessed."""

    @wraps(func)
    def wrapper(url: str) -> str:
        key = f"count:{url}"
        r.incr(key)
        return func(url)

    return wrapper


def cache_page(func: Callable) -> Callable:
    """Decorator to cache the result of a function with an expiration time."""

    @wraps(func)
    def wrapper(url: str) -> str:
        key = f"page:{url}"
        page = r.get(key)

        if page:
            return page.decode('utf-8')

        result = func(url)
        r.setex(key, 10, result)
        return result

    return wrapper


@count_url_accesses
@cache_page
def get_page(url: str) -> str:
    """Returns the HTML content of a particular URL."""
    response = requests.get(url)
    return response.text


if __name__ == "__main__":
    URL = "http://slowwly.robertomurray.co.uk"
    print(get_page(URL))
    print(r.get(f"count:{URL}"))
