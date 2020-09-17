# splunk-windows-custom-powershell-scripts
Splunk App for windows custom powershell script inputs


OVERVIEW
--------
The Splunk app for custom windows powershell script inputs.

* Author - CrossRealms International Inc.
* Version - 1.0.0
* Build - 1
* Creates Index - False
* Compatible with:
   * Splunk Enterprise version: 8.0, 7.3, 7.2 and 7.1
   * OS: Platform independent (Windows only for data collection)
   * Browser: No UI in the App.



TOPOLOGY AND SETTING UP SPLUNK ENVIRONMENT
------------------------------------------
This app can be set up in two ways: 
  1. Standalone Mode: (This is hardly used configuration, you would mostly need when you have a lot of Windows servers.)
     * Install the `Windows custom Powershell scripts` on the Windows Splunk Heavy Forwarder.
  2. Distributed Mode: 
     * Install the App on the Windows Universal Forwarder. (You can do it with Deployment-Server as well.)
     * Enable the required inputs on the Forwarders.
     * Install on the Indexers if your UF is forwarding data directly to Indexers or install on the Heavy Forwarder if you are forwarding data from UF to Heavy Forwarder. (Required for data parsing.)
     * Install the `Windows custom Powershell scripts` on the search head. (Required for extractions.)


INSTALLATION
------------
Follow the below-listed steps to install an App from the bundle:

* Download the App package.
* Install from UI:
  * From the UI navigate to `Apps > Manage Apps`.
  * In the top right corner select `Install app from file`.
  * Select `Choose File` and select the App package.
  * Select `Upload` and follow the prompts.
* With Backend::
  * Extract the downloaded package under $SPLUNK_HOME/etc/apps directory.
* With Deployment-Server:
  * Extract the downloaded package under $SPLUNK_HOME/etc/deployment-apps directory.


CONFIGURATION
-------------
* Enable the required inputs from inputs.conf.

UNINSTALL APP
-------------
To uninstall app, user can follow below steps:
* SSH to the Splunk instance
* Go to folder apps($SPLUNK_HOME/etc/apps)
* Remove the `windows_custom_powershell_scripts` folder from apps directory
* Restart Splunk

KNOWN LIMITATION
----------------
* NA

RELEASE NOTES
-------------
Version 1.0.0
* Created App with two powershell script and their required inputs, data parsing and field extraction configurations.


OPEN SOURCE COMPONENTS AND LICENSES
------------------------------
* NA


TROUBLESHOOTING
---------------
* Data collection issue
  * On Universal Forwarder check monitor and powershell both the inputs are enabled.
  * On Universal Forwarder check `$SplunkHome\var\log\windows_custom_powershell_scripts` to see whether it is generating the logs required or not.


CONTRIBUTORS
------------
* Vatsal Jagani


SUPPORT
-------
* Contact - CrossRealms International Inc.
  * US: +1-312-2784445
* License Agreement - https://d38o4gzaohghws.cloudfront.net/static/misc/eula.html
* Copyright - Copyright Crossrealms Internationals, 2020
