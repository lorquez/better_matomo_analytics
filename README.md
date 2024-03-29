# better_matomo_analytics
*GTM template for Matomo Analytics*
This template serves the purpose of making it easier to implement Matomo Analytics for people without programming skill or that simply want to do it in a more agile way. It comes with a tag and a config variable templates. The config variable tamplates is needed to easily share configuration settings among several tags, like it happens in Universal Analytics, but unlike UA, this config variable is *mandatory*, for Matomo tags will not work without it.


# Installation
The templates are not yet available in the community templates. To install this templates, simply download them directly from github and import them in a GTM container.

# Main characteristics
* this repository has a tag and a config variable that work together like the Universal Analytics ones
* ecommerce is being parsed from a UA or GA4 ecommerce object
* ecommerce cannot be set manually in the tag (create a UA or GA4  ecommerce object instead, if needed)
* goals must be set together with events or pageviews and can inherit their value from the ecommerce object
* event value can also be inherited from the ecommerce object or goal value field
* the config variable carries over basic configuration settings to each tag that uses it (more agile tags creation)
* the tag and variable are compatible with Google Consent API
* consent status and consent changes are automatically detected
* the tag and variable can also be adapted to any type of cookie system
* it is possible to manually set page title or url
* compatible with custom metrics and dimensions
* compatible with navigator.sendBeacon()