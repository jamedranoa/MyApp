App.Models.Place = Backbone.Model.extend({
  urlRoot: "/api/places",

  toJSON: function(){
    // We want proper namespacing of our attributes in Rails.
    var attributes = _.clone(this.attributes);
    return {post: attributes};
  }

});
