angular.module('appModule')
.filter('categorySort', function() {
	return function(items,cat) {
		if(cat === "all" || cat === undefined) {
			return items;
			}

	    var results = [];
	    items.forEach(function(item) {
	      if (item.category.name === cat ) {

	        results.push(item);
	      }
	    });
	    return results;
	  }
	})