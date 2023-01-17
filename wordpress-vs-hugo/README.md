# WordPress vs. HUGO

These sample applications compare a very simple Wordpress website with the  
default template to a copy of that website generated with HUGO.

The research question is to compare the energy for accessing a Wordpress site  
vs. a static site from HUGO.

Additionally we have looked at the energy for generating the HUGO page in the build  
process, so check out the <https://github.com/green-coding-berlin/wordpress-static>
repository.

## Measurements

You can find all the measurements on <https://metrics.green-coding.berlin/> by searching
for the repository URL.

If you want to run the measurements locally to falsify be sure to append the  
`--allow-unsafe` flag if you are measuring the **wordpress-minimal** site.

## Measurement Results

![Web Request Energy HUGO](https://img.shields.io/badge/Web%20Request%20Energy%20HUGO-0.977%20J-orange)
![Web Request Energy Wordpress](https://img.shields.io/badge/Web%20Request%20Energy%20Wordpress-10.08%20J-orange)

## Case Studies

Look at our case studies where we analyze the data: <https://www.green-coding.berlin/case-studies/wordpress-vs-hugo-cloudflare/>
