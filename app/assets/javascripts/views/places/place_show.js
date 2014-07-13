App.Views.PlaceShow = Backbone.View.extend({

  template: function () {
    return this.open ? JST["places/edit"] : JST["places/show"];
  },

  events: {
    "click #edit": "beginEditing",
    "submit form": "endEditing",
    "click #modal": "endEditing"
  },

  initialize: function (options) {
    this.open = false;
    this.listenTo(this.model, "change", this.render);
  },

  beginEditing: function () {
    this.model.get("owner_id") === Window.currentUserId ? this.open = true : this.open = false;
    this.render();
  },

  endEditing: function (event) {
    if (event.target.id === "cancel"){
      event.preventDefault();
      this.open=false;
      this.render();
    }

    if (event.target.id === "modal" || event.type === "submit") {
      event.preventDefault();
      var params = $("form").serializeJSON();
      this.model.set(params["place"]);
      this.model.save();
      this.open = false;
      this.render();
    }
  },

  render: function () {
    var renderedContent = this.template()({ place: this.model });
    this.$el.html(renderedContent);

    return this;
  }


});
