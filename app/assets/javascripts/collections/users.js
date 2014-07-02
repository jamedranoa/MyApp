App.Collections.Users = Backbone.Collection.extend({

  url: "/api/users",
  
  model: App.Models.User,
  
  getOrFetch: function (id) {
    var users = this;

    var user;
    if (user = this.get(id)) {
      user.fetch();
    } else {
      user = new App.Models.user({ id: id });
      user.fetch({
        success: function () { users.add(user); }
      });
    }

    return user;
  }
  

});
