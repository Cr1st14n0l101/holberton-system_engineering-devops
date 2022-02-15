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
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    user_agent = {'User-agent': 'Mozilla/5.0'}
    resp = requests.get(
        url, headers=user_agent, allow_redirects=False
        )
    if resp.status_code == 404:
        return 0
    data = resp.json()
    return data.get('data').get('subscribers')
