angular
		.module("appModule")
		.component(
				'chart',
				{
					templateUrl : 'app/chartModule/chartComponent/chart.component.html',
					controller : function($scope, priceService) {

						var dates = [];
						var itemPrices = [];
						
						var getPrices = function() {
							priceService.index().then(function(res) {
								var prices = res.data;
								
								var totalPerUpdate = [];
								var j = 0;
								
								while (prices.length > 0 && j < 100) {
									
									var currDate = new Date(prices.shift());
									currDate.seconds(0);
									currDate.milliseconds = 0;
									
									prices.forEach(function(v,i,a){
										if(v.date === currDate.date){
											currDate.price += prices.splice(i,1).price
										}
									})
									totalPerUpdate.push(currDate);
									j++;
									
									console.log(typeof currDate.date);
								}
								
								
								console.log(totalPerUpdate);
								console.log(prices);
								
								
								
								

								prices.forEach(function(v,i,a){
									dates.push(new Date(v.date));
									itemPrices.push(v.itemPrice);
								})
								console.log(itemPrices);
								dates.sort();
								itemPrices.sort(function(a,b){return b-a});
								
							})
						}
						getPrices();
						$scope.labels = dates;
						$scope.series = [ 'Series A', 'Series B' ];
						$scope.data = itemPrices;
						$scope.onClick = function(points, evt) {
							console.log(points, evt);
						};
						$scope.datasetOverride = [ {
							yAxisID : 'y-axis-1'
						}, {
							yAxisID : 'y-axis-2'
						} ];
						$scope.options = {
							scales : {
								yAxes : [ {
									id : 'y-axis-1',
									type : 'linear',
									display : true,
									position : 'left'
								}, {
									id : 'y-axis-2',
									type : 'linear',
									display : true,
									position : 'right'
								} ]
							}
						}
					}
				});
