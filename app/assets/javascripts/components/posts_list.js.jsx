/** @jsx React.DOM **/

var Post = require('./post');

var PostsList = React.createClass({
    render: function() {
        var posts = this.props.posts.map(function(post) {
            return <Post key={post.id} post={post} />;
        });

        return (
            <div className="posts">
                {posts}
            </div>
        );
    }
});

module.exports = PostsList;
