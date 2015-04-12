$(function () {
    $(document).ready(function () {
        $('#onedaykwh').click(function () {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        $('#graph-container7').highcharts({
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // don't animate in old IE
                marginRight: 10,
                events: {
                    load: function () {

                        // set up the updating of the chart each second
                        var series = this.series[0];
                        var series2 = this.series[1];
                        setInterval(function () {
                            var x = (new Date()).getTime(), // current time
                                y = Math.random();
                            series.addPoint([x, y], true, true);
                                y = Math.random();
                            series2.addPoint([x, y], true, true);
                        }, 1000);
                    }
                }
            },
            title: {
                text: 'ENERGY CONSUMPTION IN KILO-WATTS',
                style: {
                    color: '#aaaaaa'
                }
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Energy (Kilo-Watts)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
            //layout: 'vertical',
            //align: 'right',
            //verticalAlign: 'middle',
            borderWidth: 0,
            itemStyle: {
                 fontSize:'15px',
                 font: '15px UNICA ONE, sans-serif',
                 color: '#A0A0A0'
              }
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Median',
                color: "#FF6600",
                data: (function () {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;

                    for (i = -19; i <= 0; i += 1) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data;
                }())
            },
            {
                name: 'User12\'s consumption',
                color: '#ADFF2F',
                data: (function () {
                    // generate an array of random data
                    var data2 = [],
                        time = (new Date()).getTime(),
                        i;

                    for (i = -19; i <= 0; i += 1) {
                        data2.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data2;
                }())
            }]
        });
    });
});
});