/** @jsx React.DOM **/

var Context = require('../lib/context'),
    Routes = require('../routes').Routes,
    PostStore = require('../stores/post_store'),

    MainSection = require('./main_section');

var App = React.createClass({
    getInitialState: function () {
        return this.props.initialAppState;
    },

    componentWillMount: function() {
        // Create new context for the app
        this.context = new Context();
        // Register stores on the new context
        this.context.registerStore(new PostStore());
        // Dispatch initial state
        this.context.dispatchInitialState(this.state);
    },

    render: function () {
        return (
            <div className="blog-app">
                <h1>My Awesome Blog!</h1>
                <MainSection context={this.context}/>
            </div>
        );
    }
});

module.exports = App;
