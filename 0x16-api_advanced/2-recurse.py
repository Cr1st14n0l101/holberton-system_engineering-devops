#!/bin/usr/python3
"""
Module for recurse function
"""
import requests
import json


def recurse(subreddit, hot_list=[], idx=0, response=None, after=''):
    """
    Queries the Reddit API and returns a
    list containing the titles of all hot
    articles for a given subreddit. If no
    results are found for the given
    subreddit,the function should return None
    """
    if idx == 0:
        user_agent = {'User-agent': 'Mozilla/5.0'}
        page = 'https://www.reddit.com/r/' + subreddit + '/hot.json' + after
        response = requests.get(page, headers=user_agent)
    if response.status_code == 200:
        info = json.loads(response.content)
        if idx >= len(info.get('data').get('children')):
            if info['data']['after'] is not None:
                after = '?after=' + info.get('data').get('after')
                idx = 0
                return recurse(subreddit, hot_list, idx, response, after)
            else:
                return hot_list
        hot_list.append(
            info.get('data').get('children')[idx].get('data').get('title')
            )
        idx += 1
        return recurse(subreddit, hot_list, idx, response, after)
    return None
