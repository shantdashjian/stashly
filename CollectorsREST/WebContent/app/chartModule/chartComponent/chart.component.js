angular
		.module("appModule")
		.component(
				'chart',
				{
					templateUrl : 'app/chartModule/chartComponent/chart.component.html',
					controller : function($scope, priceService, $routeParams) {

						var dates = [];
						var totalValue = [];

						var getPrices = function() {
							priceService.indexByItem($routeParams.id).then(
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

						console.log(dates);
						console.log(totalValue);

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
								} ],
									scaleLabel : "<%= Number(value).toFixed(2).replace('.', ',') + ' $'%>"
							}
						};

					}
				});
