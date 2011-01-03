#Redmine CC Addresses Plugin
##About
Allows the addition of generic CC entries to allow status messages to get sent to non-registered or other external members of a project / Redmine instance.
###Features
+ Permissions for Viewing, Creating, and Removing Addresses from issues
+ Extends Redmine's existing Mailer model, rules like BCC recipients are obeyed
+ Validates email addresses on entry (the regex here may require tweaking, we'll see)

###Version
+ Currently at 0.1.1
+ Requires Redmine 0.9.x (built/tested on 0.9.6, untested on previous versions, but it should work...)
+ Refuses to work on Redmine 1.0.0. \([Bug filed](http://www.redmine.org/issues/6000)\)
 + The workaround is to manually add <tt>cc\_addresses\_attributes</tt> to the <tt>SAFE_ATTRIBUTES</tt> array in the Issue model.
 + As of 12/12/2010 this has been fixed in the Redmine Trunk and should be in the next release. edelgado is working on integrating the changes necessary for it to run cleanly under newer releases.

###Usage
####Install
1. `cd [redmine]/vendor/plugins/`
2. `git clone http://github.com/peelman/redmine_cc_addresses.git`
3. `rake db:migrate_plugins`
4. `touch [redmine]/tmp/restart.txt`
5. Profit?

####Enabling and Permissions
+ Needs to be enabled per-project in the Modules tab
+ Permissions are set via the traditional role method

###Screenshots
![CC Addresses in action](http://peelman.us/skitch/redmine-cc-addresses-screenshot-20100713-211632.png)

##Author
Nick Peelman

- nick \[at\] peelman \[dot\] us
- [peelman.us](http://peelman.us)
- [Github.com/peelman](http://github.com/peelman)

##Credits
Extrapolated and hacked as a cross between:

+ My own Departments plugin \(http://github.com/peelman/redmine_departments\)
+ Daniel Vandersluis's Redmine Resources plugin \(http://github.com/dvandersluis/redmine_resources\)
and
+ Dave Thomas's CClist plugin \(http://github.com/peoplemerge/redmine-cclist-plugin\)
+ Thanks to [edelgado](http://github.com/edelgado) and [mtah](http://github.com/mtah) for their contributions!

Extra Special Thanks to Chris Moore (http://github.com/cdmwebs)

##Licensing
* This plugin is open-source and licensed under the "GNU General Public License v2" (GPL, http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
* &copy; 2010 Nick Peelman