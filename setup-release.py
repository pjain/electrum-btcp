"""
py2app build script for Electrum Bitcoin Private

Usage (Mac OS X):
     python setup.py py2app
"""

from setuptools import setup
from plistlib import Plist
import requests
import os
import shutil

from lib.version import ELECTRUM_VERSION as version

CERT_PATH = requests.certs.where()

name = "Electrum BTCP"
mainscript = 'electrum-btcp'

plist = Plist.fromFile('Info.plist')
plist.update(dict(CFBundleIconFile='icons/electrum.icns'))


os.environ["REQUESTS_CA_BUNDLE"] = "cacert.pem"
shutil.copy(mainscript, mainscript + '.py')
mainscript += '.py'
extra_options = dict(
    setup_requires=['py2app'],
    app=[mainscript],
    packages=[
        'electrum-btcp',
        'electrum-btcp_gui',
        'electrum-btcp_gui.qt',
        'electrum-btcp_plugins',
        'electrum-btcp_plugins.audio_modem',
        'electrum-btcp_plugins.cosigner_pool',
        'electrum-btcp_plugins.email_requests',
        'electrum-btcp_plugins.greenaddress_instant',
        'electrum-btcp_plugins.hw_wallet',
        'electrum-btcp_plugins.keepkey',
        'electrum-btcp_plugins.labels',
        'electrum-btcp_plugins.ledger',
        'electrum-btcp_plugins.trezor',
        'electrum-btcp_plugins.digitalbitbox',
        'electrum-btcp_plugins.trustedcoin',
        'electrum-btcp_plugins.virtualkeyboard',

    ],
    package_dir={
        'electrum-btcp': 'lib',
        'electrum-btcp_gui': 'gui',
        'electrum-btcp_plugins': 'plugins'
    },
    data_files=[CERT_PATH],
    options=dict(py2app=dict(argv_emulation=False,
                             includes=['sip'],
                             packages=['lib', 'gui', 'plugins'],
                             iconfile='icons/electrum.icns',
                             plist=plist,
                             resources=["icons"])),
)

setup(
    name=name,
    version=version,
    **extra_options
)

# Remove the copied py file
os.remove(mainscript)
