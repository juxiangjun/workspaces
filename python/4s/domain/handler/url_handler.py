#!/usr/bin/env python
class UrlHandler:
    def get_url_list(self, config, node, values):
        url_list = []
        url = config.get(node, 'url')
        for value in values:
            tmp  = url.format(value)
            url_list.append(tmp)
        return url_list 
