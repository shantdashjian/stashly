angular.module('appModule')
.filter('searchByName', function(){
  return function(items, keywords) {	  
	  if (!keywords) {
		  return items;
	  } else {
		  var results = [];
		  items.forEach(function(item) {
		      if (item.name.toLowerCase().includes(keywords.toLowerCase())) {
		        results.push(item);
		      }
		  });
		  return results;
	  }
    
  }
});