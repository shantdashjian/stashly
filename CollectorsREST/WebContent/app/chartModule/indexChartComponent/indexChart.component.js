angular
		.module("appModule")
		.component(
				'indexChart',
				{
					templateUrl : 'app/chartModule/indexChartComponent/indexChart.component.html',
					controller : function($scope, priceService, $routeParams) {

						var dates = [];
						var totalValue = [];

						var getPrices = function() {
							priceService.index().then(
									function(res) {
										var prices = res.data;

										prices.sort(function compareNumbers(a,b) {
											return (new Date(a.date) - new Date(b.date));
										})

										var options = {
											month : "short",
											day : "numeric",
											hour : "2-digit",
											minute : "2-digit"
										};

										prices.forEach(function(v, i, a) {

											totalValue.push(v.itemPrice);
											dates.push(new Date(v.date)
													.toLocaleTimeString(
															"en-US", options));
										})

									})
						}

						getPrices();

						$scope.labels = dates;
						$scope.data = [totalValue];
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
									position : 'left',
									labelString : "Value in US Dollars ($)"
								} ]
							}
						};

					}
				});
