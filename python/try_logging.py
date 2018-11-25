import logging
import logging.config
import yaml

with open("./config/config.yml") as yml:
    config = yaml.load(yml.read())
logging.config.dictConfig(config)

# create logger
logger = logging.getLogger('fileRotatingHandler')
logger.debug("abcde")
