const express = require('express');
const router = express.Router();

const BlogPost = require('../models/blogPosts');


// Routes
router.get('/', (req, res) => {
  
    BlogPost.find({ })
        .then((data) => {  
            console.log('Data: ', data);
            res.json(data);

        })
        .catch((error) => {
            console.log('Error: ', error);

        });
});



router.post('/save', (req, res) => {
    const data = req.body;
    const newBlogPost = new BlogPost(data);


    // .save
    newBlogPost.save((error) => {
        if (error) {
            res.status(500).json({ msg: 'Sorry, internal server errors' });
            return;
        }
   
        // BlogPost    
        return res.json({
            msg: 'data received'
        });
              
    });
    
});

/*
// a more static example...
router.get('/name', (req, res) => {
    const data = {
        username: 'vname',
        age: 5
    };
    res.json(data);

});
*/

module.exports = router;