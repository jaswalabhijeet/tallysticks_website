# Tallysticks
#### Static website (responsive) + Blockchain contact form (JS client code)

##### http://tallysticks.io - Invoice Reconciliation Platform  

Contains a contact form that saves some contact details to a private ethereum blockchain - the current solution uses the **BApp Framework**, check it out at: https://github.com/appliedblockchain/bapp

---

This website / app:

#### Install prerequisites

    gem i haml


#### Build

    ./build.sh


#### Watch task

recompiles haml to html, and coffeescript to js, automatically

    ./watch.sh

you will need to `gem i bundler` and `bundle` first
