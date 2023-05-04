# Nextcloud using Firefox

This benchmark runs the apache-mariadb setup with firefox as a browser. It also showcases build capabilities of the GMT
as firefox with puppeteer does't work with cps. We can not use the official Nextcloud image as this sets
`Content-Security-Policy` headers which then make firefox stop the puppeteer script. Firefox also doesn't give you
an easy way to disable this behavior 🤮. See:

- https://bugzilla.mozilla.org/show_bug.cgi?id=1754301
- https://stackoverflow.com/questions/57426099/call-to-eval-blocked-by-csp-with-selenium-ide
- https://github.com/puppeteer/puppeteer/issues/5755

Please see the `README.md` in the `chrome` folder for a more detailed discussion on the actual benchmarks.
