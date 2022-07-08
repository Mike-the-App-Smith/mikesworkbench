const mongoose = require('mongoose');
/*
What data do I really want from the user and why? Why === an example of CRUD, just need to Update and Delete the blog posts...
Who will be users of this site? ---> mostly for employers? 
or I will just give it to my students, but as of now only the 3k list is it for them...

I should look for more online examples of database usage with MERN
*/
// DB Schema? "The Plan/layout for the data model"
const Schema = mongoose.Schema;
const BlogPostSchema = new Schema({
    title: String,
    body: String,
    date: {
        type: String,
        default: Date.now()
    }
});

// Model "puts the Schema into the Model"
const BlogPost = mongoose.model('BlogPost', BlogPostSchema);

module.exports = BlogPost;


/*                 "PREVIOUS SAMPLE DATA USED FOR LEARNING"
// Saving data to the database "puts the data entry into the model"
const data = {
    title: 'Welcome to the M.Proven.Portfolio',
    body: 'I made the database with Mongoose/MongoDB, the View with React, and tied it all together with Node.js'
};

const newBlogPost = new BlogPost(data); // instance of the data


// save sample data
newBlogPost.save((error) => {
    if (error) {
        console.log('Error messages???');
    } else {
        console.log('Data has been saved!!!')
    }
});
// .save();

*/