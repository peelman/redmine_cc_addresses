#Redmine / ChiliProject CC Addresses Plugin
##About
Allows the addition of generic CC entries to allow status messages to get sent to non-registered or other external members of a project / Redmine/CP instance.
###Features
+ Permissions for Viewing, Creating, and Removing Addresses from issues
+ Extends Redmine/CP's existing Mailer model, rules like BCC recipients are obeyed
+ Validates email addresses on entry (the regex here may require tweaking, we'll see)

###Version
+ Currently at 0.2
+ Requires Redmine 1.1.x or later 

	or

+ Requires ChiliProject 2.0 or later

###Languages
+ English
+ German

	If you'd like to submit a translation, please do so!

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
+ Thanks to [edelgado](http://github.com/edelgado), [mtah](http://github.com/mtah), and [cforce](http://github.com/cforce) for their contributions!

Extra Special Thanks to Chris Moore (http://github.com/cdmwebs)

##Licensing
* This plugin is open-source and licensed under the "GNU General Public License v2" (GPL, http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
* &copy; 2010-2011 Nick Peelman