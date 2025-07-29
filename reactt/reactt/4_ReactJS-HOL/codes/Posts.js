import React, { Component } from 'react';

class Posts extends Component {
  constructor() {
    super();
    this.state = { posts: [], hasError: false };
  }

  loadPosts = () => {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(res => res.json())
      .then(data => this.setState({ posts: data }))
      .catch(() => this.setState({ hasError: true }));
  }

  componentDidMount() {
    this.loadPosts();
  }

  componentDidCatch(error, info) {
    alert("Error occurred: " + error);
  }

  render() {
    return (
      <div>
        {this.state.hasError ? (
          <h1>Error loading posts</h1>
        ) : (
          this.state.posts.map(post => (
            <div key={post.id}>
              <h3>{post.title}</h3>
              <p>{post.body}</p>
            </div>
          ))
        )}
      </div>
    );
  }
}

export default Posts;
