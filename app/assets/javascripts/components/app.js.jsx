/** @jsx React.DOM **/

var PostsList = require('./posts_list');

var App = React.createClass({
    getInitialState: function () {
        return this.props.initialAppState;
    },

    render: function () {
        return (
            <div className="blog-app">
                <h1>My Awesome Blog!</h1>
                <PostsList posts={this.state.posts}/>
            </div>
        );
    }
});

module.exports = App;
