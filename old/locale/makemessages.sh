#!/bin/bash

xgettext -k_ --files-from=files.lst -C --package-version 1.2 --package-name messages --default-domain messages --output=messages.pot --from-code=UTF-8
mkdir -p ru/LC_MESSAGES
msginit --no-translator --locale ru_RU.UTF-8 -o ru/LC_MESSAGES/messages.po -i messages.pot