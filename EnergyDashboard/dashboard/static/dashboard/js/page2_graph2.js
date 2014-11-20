$(function () {
    $('#graph-container2').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'Average Monthly Cost based on Consumption'
        },
        xAxis: [{
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '${value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Cost in dollars',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: 'Average Consumption',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value} kwh',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        series: [{
            name: 'Average Consumption',
            type: 'column',
            yAxis: 1,
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
            tooltip: {
                valueSuffix: ' kwh'
            }

        }, {
            name: 'Cost',
            type: 'spline',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
            tooltip: {
                valueSuffix: ' dollars'
            }
        }]
    });
});






//         title: {
//             text: 'Combination chart'
//         },
//         xAxis: {
//             categories: ['Jan', 'Feb', 'Mar', 'April', 'May']
//         },
//         yAxis: {
//             title: {
//                 text: 'kWh'
//             }
//         },
//         labels: {
//             items: [{
//                 html: 'Total energy consumption',
//                 style: {
//                     left: '50px',
//                     top: '18px',
//                     color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
//                 }
//             }]
//         },
//         tooltip: {
//             shared: true,
//             valueSuffix: ' kWh'
//         },
        
//         series: [{
//             type: 'column',
//             name: 'Jane',
//             data: [300, 200, 100, 300, 400]
//         }, {
//             type: 'column',
//             name: 'John',
//             data: [200, 300, 500, 700, 600]
//         }, {
//             type: 'column',
//             name: 'Joe',
//             data: [400, 300, 300, 900, 10]
//         }, {
//             type: 'spline',
//             name: 'Average',
//             data: [300, 267, 300, 633, 333],
//             marker: {
//                 lineWidth: 2,
//                 lineColor: Highcharts.getOptions().colors[3],
//                 fillColor: 'white'
//             }
//         }, {
//             type: 'pie',
//             name: 'Total consumption',
//             data: [{
//                 name: 'Jane',
//                 y: 400,
//                 color: Highcharts.getOptions().colors[0] // Jane's color
//             }, {
//                 name: 'John',
//                 y: 730,
//                 color: Highcharts.getOptions().colors[1] // John's color
//             }, {
//                 name: 'Joe',
//                 y: 519,
//                 color: Highcharts.getOptions().colors[2] // Joe's color
//             }],
//             center: [100, 80],
//             size: 100,
//             showInLegend: false,
//             dataLabels: {
//                 enabled: false
//             }
//         }]
//     });
// });

