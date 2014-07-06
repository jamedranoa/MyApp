App.Views.PlaceShow = Backbone.View.extend({

  template: function () {
    return this.open ? JST["places/edit"] : JST["places/show"];
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
    this.model.set(params["place"]);
    this.model.save();

    this.render();
  },

  render: function () {
    var renderedContent = this.template()({ place: this.model });
    this.$el.html(renderedContent);

    return this;
  }


});
