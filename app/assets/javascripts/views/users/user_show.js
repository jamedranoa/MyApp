App.Views.UserShow = Backbone.View.extend({

  template: function () {
    return this.open ? JST["users/edit"] : JST["users/show"];
  },

  events: {
    "click li.to-edit": "beginEditing",
    "click .title": "beginEditing",
    "submit form": "endEditing",
    "click #modal": "endEditing",
  },

  initialize: function (options) {
    this.open = false;
    this.listenTo(this.model, "change", this.render);
  },

  beginEditing: function () {

    if(this.model.id === Window.currentUserId){
        this.open = true
        this.$el.addClass("mine")
      }
    this.render();
  },

  cancelEditing: function () {
    this.open = false
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
      this.model.set(params["user"]);
      this.model.save();
      this.open = false;
      this.render();
    }



  },

  render: function () {
    var renderedContent = this.template()({ user: this.model });
    this.$el.html(renderedContent);

    return this;
  }


});
