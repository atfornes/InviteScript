# InviteScript

Script to invite to a mediawiki with [inviteSignup](https://www.mediawiki.org/wiki/Extension:InviteSignup) module installed to a list of emails.

it accepts an email as parameter and invite it to the wiki. If you have a list of emails in a text file, each of them in a separate line you can call the following command:

``` cat emails.txt | xargs -L1 ./inviteScript.sh ```

## Configuration

To use it in your wiki, set the following information in inviteScript.sh:

 - **name**: as the admin user name in the wiki
 - **pass**: as the password of the admin user in the wiki
 - **url**: as the wiki url address