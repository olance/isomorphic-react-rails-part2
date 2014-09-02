/** @jsx React.DOM **/

var PostsList = require('./posts_list');

var PostStore;

function stateFromStores() {
    return {
        posts: PostStore.allPosts()
    };
}

var MainSection = React.createClass({
    getInitialState: function() {
        PostStore = this.props.context.findStore('PostStore');
        return stateFromStores();
    },

    componentWillMount: function() {
        PostStore.addChangeListener(this._onChange);
    },

    componentWillUnmount: function() {
        PostStore.removeChangeListener(this._onChange);
    },

    render: function () {
        console.log('render!');
        return (
            <PostsList posts={this.state.posts}/>
        );
    },

    _onChange: function() {
        this.setState(stateFromStores());
    }
});

module.exports = MainSection;
