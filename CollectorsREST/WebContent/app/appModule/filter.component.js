angular.module('appModule')
.filter('categorySort', function() {
	return function(items,cat) {
		console.log(cat)
		if(cat === "All") return items;
		
	    var results = [];
	    items.forEach(function(item) {
	      if (item.category.name === cat ) {
	    	  console.log("in filter");
	        results.push(item);
	      }
	    });
	    return results;
	  }
	})