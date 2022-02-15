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
    try:
        user_agent = {'User-agent': 'Mozilla/5.0'}
        resp = requests.get(
            'https://www.reddit.com/r/' + subreddit
            + '/hot.json?limit=10', headers=user_agent
            )
        if resp.status_code == 200:
            data = resp.json()
            for title in data.get('data').get('children'):
                print(title.get('data').get('title'))
                return
        print('None')
    except Exception:
        print('None')
