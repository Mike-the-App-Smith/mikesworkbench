import React from 'react';
import axios from 'axios';

import './App.css';

// import logo from './logo.svg';


class App extends React.Component {

  state = {
    title: '',
    body: '',
    posts: []
  };

  componentDidMount = () => {
    this.getBlogPost();
  };


  getBlogPost = () => {
    axios.get('/api')
      .then((response) => {
        const data = response.data;
        this.setState({ posts: data })
        console.log('Data has been received.');        
      })
      .catch(() => {
        console.log('Server error.'); // was alert, but not for production
      });
  };


  handleChange = ({target}) => {
    const { name, value} = target;
        // old code changed due to above ^ target was event
    // const target = event.target;
    // const name = target.name;
    // const value = target.value;
    this.setState({ [name]: value });
  };

  submit = (event) => {
    event.preventDefault();

    const payLoad = {
      title: this.state.title,
      body: this.state.body
    };


    axios({
      url: '/api/save',
      method: 'POST',
      data: payLoad
    })
      .then(() => {
        console.log('Data has been sent.');
        this.resetUserInputs();
        this.getBlogPost();
        
      })
      .catch(() => {
        console.log('Server error.');

      });

  };


  resetUserInputs = () => {
    this.setState({
      title: '',
      body: ''
    });

  };

  displayBlogPost = (posts) => {
    if (!posts.length) return null;

    return posts.map((post, index) => (
      <div key={index} className="blog-post_display well"> 
        <h3>{post.title}</h3>
        <p>{post.body}</p>
      </div>
    ));
  };


  render() {

    console.log('State: ', this.state)
    //JSX
    // <a href="https://www.freecodecamp.org/m-proven" target="_blank" rel="noreferrer">freeCodeCamp.org <i class="fab fa-free-code-camp"></i> link</a>
    // <a href="https://youtube.com/playlist?list=PLurIMwd6GdCj_VlnKVceR66Sxfcb37VU8" target="_blank" rel="noreferrer">YouTube <i class="fab fa-youtube"></i></a> 
    return(
      <div className="container">
        <header  className="jumbotron text-center row negative">
      <div className="col-sm-12 outer">
        <h1>Welcome to the M.Proven.Portfolio</h1><h2>created by: Mike Provenzano</h2>
      
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It is my intent that by building this into a portfolio website I will improve as a programmer and web developer.</p><video width="320" height="240" controls>
  <source src="pitch.mp4" type="video/mp4"/>
  Your browser does not support the video tag.
</video>
      </div><div class="col-sm-6 negative">
        <p className="inner">While I was an ESL teacher I made this app to help my students improve their vocabulary. It's a 15-week self-paced course on the 3,000 most commonly used words in English. <br />
          
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="./engIn15Wks/index.html" target="_self" >go to English in 15 Weeks</a></p>
      </div><div class="col-sm-6 outer">
            
        <p>The code for this web-portfolio can be found on my <a href="https://github.com/m-proven-portfolio/home-page" rel="noreferrer" target="_blank">GitHub <i class="fab fa-github"></i></a>. Thank you for your interest and I look forward to collaborating with you and your company.</p>
     {/* <div class="negative">
        <form>
          <label id="title-label">Email: </label><br/>
          <input type="email" id="email" placeholder="Your email here"/><br/>
          <label id="title-label">Subject: </label><br/>
          <input type="text" id="sub" placeholder="Your subject here"/><br/>              
            <label id="content-label">Email Body: </label><br/>
            <textarea  
            id="content" 
            name="content" 
            rows="9" 
            cols="32" 
            placeholder="What would you like to talk about?"></textarea><br/>
            <button className="form-control btn-danger" id="submit" type="submit">Send me a message.</button>
        </form>

    </div>*/}
    </div></header>
        <form id="Blog-Posts" action="#" method="POST" target="_self" onSubmit={this.submit}>
          <div className="form-group">
          <div className="form-input">
            <label id="title-label">Title: </label><br/>
            <input type="text" class="form-control" 
            id="title" 
            name="title" 
            value={this.state.title} 
            onChange={this.handleChange} 
            placeholder="Type your main idea here." 
            required/><br/>
          </div>
          <div className="form-input">            
            <label id="body-label">What do you have to say?</label><br/>
            <textarea  class="form-control" 
            id="body" 
            name="body" 
            rows="9" 
            cols="32" 
            value={this.state.body} 
            onChange={this.handleChange} 
            placeholder="Type your supporting thoughts here.">

            </textarea>
          </div>  

          <button className="form-control btn-danger" id="submit" type="submit">Post your thoughts.</button>

        </div></form>

        <div className="blog-posts">
          {this.displayBlogPost(this.state.posts)}
        </div>
      </div>

    );
  }
}

// function App() {
//   return (
//     <div className="App"> html BETWEEN 2 DIV TAGS
//     </div>
//   );
// }
export default App;
