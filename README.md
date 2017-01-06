# das.kapital

Automated fixes:

* merge hyphen words - (char probably U+002D)
* replace double equal signs on line break
* fix quotation marks („…“ to «…») in Book II and Franko


Rename files:

   find -name '*.txt' | sort | gawk 'BEGIN{ a=61 }{ mv "echo %s %04d.txt\n", $0, a++ }' | bash 

Test rename:

   find -name '*.txt' | sort | gawk 'BEGIN{ a=61 }{ printf "echo %s %04d.txt\n", $0, a++ }' | bash 
