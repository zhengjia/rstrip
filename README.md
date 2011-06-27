== rstrip

rstrip provides a ruby executable that removes the trailing white space in the current project directory.

It also remove empty lines at the end of a file.

It's configurable on the file types it will operate on.

== Usage
* Install the gem: `gem install rstrip`
* In your project folder run `rstrip config generate`, or run `rstrip config generate --global true` to generate the config file in your home directory
* Modify the list of file extensions in the .rstrip config file
* In your project folder run `rstrip process`
* Examine the changes and commit the code

== Alternatives:
There are a lot of ways to do the similar thing:

* textmate bundle
https://github.com/mocoso/code-beautifier.tmbundle

* textmate marco
http://mjijackson.com/2009/01/textmate-macro-remove-trailing-space-and-save

* bash
http://stackoverflow.com/questions/149057/how-to-removing-trailing-whitespace-of-all-files-recursively

* Use a git prehook
http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing

I used the textmate marco before. The problem with textmate bundle or marco is they only modify the file if you edit and save it, which makes the commits harder to read as you will remove white spaces gradually. rstrip gets it done all in once in the folder level. Then you can use the bundle or marco with a fresh start.

rstrip also tries to make it as easy as possible so you don't need to remember the cryptic bash or perl commands.