import logging

# This is a minimal configuration to get you started with the Text mode.
# If you want to connect Errbot to chat services, checkout
# the options in the more complete config-template.py from here:
#   https://github.com/errbotio/errbot/blob/master/errbot/config-template.py
# Also see:
#   https://errbot.readthedocs.io/en/latest/user_guide/setup.html

BACKEND = 'SlackV3'

BOT_IDENTITY = {
    'token': 'xoxb-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx'
}

CHATROOM_FN = 'Errbot'

BOT_DATA_DIR = '/opt/errbot/data'
BOT_EXTRA_BACKEND_DIR = '/opt/errbot/backend'
BOT_EXTRA_PLUGIN_DIR = '/opt/errbot/plugins'

BOT_LOG_FILE = '/opt/errbot/errbot.log'
BOT_LOG_LEVEL = logging.DEBUG

BOT_ADMINS = ('@master',)

AUTOINSTALL_DEPS = True
