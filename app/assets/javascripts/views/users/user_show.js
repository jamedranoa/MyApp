App.Views.UserShow = Backbone.View.extend({
  tagName: "ul",
  template: function () {
    return this.open ? JST["users/edit"] : JST["users/show"];
  },
  
  events: {
    "dblclick li": "beginEditing",
    "submit form": "endEditing"
  },
  
  initialize: function (options) {
    this.open = false;
    this.listenTo(this.model, "change", this.render);
  },
  
  beginEditing: function () {
    
    this.model.id === Window.currentUserId ? this.open = true : this.open = false;
    this.render();
  },
  
  endEditing: function (event) {
    event.preventDefault();
    this.open = false;

    var params = $(event.currentTarget).serializeJSON();
    this.model.set(params["user"]);
    this.model.save();

    this.render();
  },
  
  render: function () {
    var renderedContent = this.template()({ user: this.model });
    this.$el.html(renderedContent);

    return this;
  }
  

});
