[< Go Back](../README.md)

# Constraints in wildcards

At the bottom of the route we must use a where to limit the wildcard using a regular expression that aligns with our wishes.

``php
->where('post', '[A-z_\-]+');
``