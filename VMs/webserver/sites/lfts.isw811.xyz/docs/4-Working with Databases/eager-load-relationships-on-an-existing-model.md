[< Go Back](../README.md)

# N+1 Problem

When a n+1 problem is present with an existing model, we use the load again `->load(['categoory', 'author'])`, but we can avoid this including in the Model `protected $with = ['category','author'];`

We got to be careful though, because it can add weight to the queries unnecessarily.