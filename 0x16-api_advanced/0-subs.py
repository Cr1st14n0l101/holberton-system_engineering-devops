#!/usr/bin/python3
"""
Module for number_of_subscribers function
"""
import requests


def number_of_subscribers(subreddit):
    """
    Function that queries the Reddit
    API and returns the number of
    subscribers
    """
    user_agent = {'User-agent': 'Mozilla/5.0'}
    resp = requests.get(
        'https://www.reddit.com/r/' + subreddit
        + '/about.json', headers=user_agent
        )
    data = resp.json()
    if data.get('error', 200) == 404:
        return 0
    return data.get('data').get('subscribers')
