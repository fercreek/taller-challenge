# Taller Challenge Ruby

Those are my notes for the Taller Challenge

* Should I create a user model or is it part of the requirements?
* I'll assume that I can use commits to version the progress.
* Let's start with the scaffold for books and then iterate.
* Once the base is set up, let's work on the reserve endpoint.

After finish the challenge, I added some comments to the code to explain some decisions,
but I tried to explain what I did.

### Explaining my process

1 - Read the requirements and asuming that I dont need for now a user model, just a user_email for the book reservation.
2 - Creating a book model using scaffold, here's where I wanted to ask about if is enough with the book model
3 - I added some specs, first the common endpoitns I just created index and post as an example
4 - Initially I created the book status as a string and using enum, but I decide to add the method just to confirm if the book is reserved or not
5 - I added the reserved endpoint, adding a render jeson error validation with `reserved?`, maybe asking about more scenarios would be good to refactor this part of code, adding a service object.
6 - I added commets for index on the approeach how to improve the performance in a quickly way, not the whole answer but pagination helps a lot

