class SlackReporter(TextReporter):
    """Send a message to a Slack channel"""

    __kind__ = 'slack'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.max_length = self.config.get('max_message_length', 40000)

    def submit(self):
        webhook_url = self.config['webhook_url']
        text = '\n'.join(super().submit())

        if not text:
            logger.debug('Not calling {} API (no changes)'.format(self.__kind__))
            return

        result = None
        for chunk in chunkstring(text, self.max_length, numbering=True):
            res = self.submit_chunk(webhook_url, chunk)
            if res.status_code != requests.codes.ok or res is None:
                result = res

        return result

    def submit_chunk(self, webhook_url, text):
        logger.debug("Sending {} request with text: {}".format(self.__kind__, text))
        post_data = self.prepare_post_data(text)
        result = requests.post(webhook_url, json=post_data)
        try:
            if result.status_code == requests.codes.ok:
                logger.info("{} response: ok".format(self.__kind__))
            else:
                logger.error("{} error: {}".format(self.__kind__, result.text))
        except ValueError:
            logger.error(
                "Failed to parse {} response. HTTP status code: {}, content: {}".format(self.__kind__,
                                                                                        result.status_code,
                                                                                        result.content))
        return result

    def prepare_post_data(self, text):
        if self.config.get('rich_text', False):
            return {
                "blocks": [
                    {
                        "type": "rich_text",
                        "elements": [
                            {
                                "type": "rich_text_preformatted",
                                "elements": [
                                    {"type": "text", "text": text}
                                ]
                            }
                        ]
                    }
                ]
            }
        else:
            return {"text": text}


class MattermostReporter(SlackReporter):
    """Send a message to a Mattermost channel"""

    __kind__ = 'mattermost'

    def prepare_post_data(self, text):
        return {"text": text}
