import logging
import time

# create logger with 'spam_application'
logger = logging.getLogger('imubit_application')
logger.setLevel(logging.DEBUG)
# create file handler which logs even debug messages
ch = logging.StreamHandler()
# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)
# add the handlers to the logger
logger.addHandler(ch)


counter = 1

while counter < 100:
    logger.debug(f"This is debug message number {counter}")
    logger.info(f"This is info message number {counter}")
    logger.error(f"This is error message number {counter}")
    counter += 1
    time.sleep(5)