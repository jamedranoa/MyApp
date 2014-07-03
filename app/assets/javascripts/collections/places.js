App.Collections.Places = Backbone.Collection.extend({

  url: "/api/places",

  model: App.Models.Place,

  getOrFetch: function (id) {
    var places = this;

    var place;
    if (place = this.get(id)) {
      place.fetch();
    } else {
      place = new App.Models.place({ id: id });
      place.fetch({
        success: function () { places.add(place); }
      });
    }

    return place;
  }


});