/** @jsx React.DOM **/

var Routes = require('../routes').Routes,
    Router = require('react-router-component'),
    Pages = Router.Pages,
    Page = Router.Page,

    PostsList = require('./posts_list');

var App = React.createClass({
    getInitialState: function () {
        return this.props.initialAppState;
    },

    render: function () {
        return (
            <div className="blog-app">
                <h1>My Awesome Blog!</h1>
                <Pages path={this.state.path}>
                    <Page path={Routes.root_path()} handler={PostsList}
                          posts={this.state.posts}/>
                </Pages>
            </div>
        );
    }
});

module.exports = App;
