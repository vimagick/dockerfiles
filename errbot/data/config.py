import logging

# This is a minimal configuration to get you started with the Text mode.
# If you want to connect Errbot to chat services, checkout
# the options in the more complete config-template.py from here:
# https://raw.githubusercontent.com/errbotio/errbot/master/errbot/config-template.py

BACKEND = 'Slack'

BOT_IDENTITY = {
    'token': 'xoxb-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx'
}

CHATROOM_FN = 'Errbot'

BOT_DATA_DIR = '/home/errbot/data'
BOT_EXTRA_PLUGIN_DIR = '/home/errbot/plugins'

BOT_LOG_FILE = '/home/errbot/errbot.log'
BOT_LOG_LEVEL = logging.DEBUG

BOT_ADMINS = ('@master', )

AUTOINSTALL_DEPS = True
