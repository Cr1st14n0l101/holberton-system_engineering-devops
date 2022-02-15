#!/bin/usr/python3
"""
Module for top_ten function
"""
import requests


def top_ten(subreddit):
    """
    Function that queries the Reddit
    API and prints the titles of the first
    10 hot posts listed for a given subreddit
    """
    user_agent = {'User-agent': 'Mozilla/5.0'}
    resp = requests.get(
        'https://www.reddit.com/r/' + subreddit
        + '/hot.json?limit=10', headers=user_agent
        )
    data = resp.json()
    if data.get('error', 200) == 404:
        print(None)
        return
    for title in data.get('data').get('children'):
        print(title.get('data').get('title'))

