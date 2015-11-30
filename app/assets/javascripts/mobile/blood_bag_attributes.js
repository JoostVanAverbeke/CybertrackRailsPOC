$(document).on("pageshow","#pagetwo",function(){
    var plots = $('#pagetwo').data('plots');
    var counter;
    var points = [];
    var series= [];

    if (plots) {
        for (counter = 0; counter < plots.length; counter++) {
            plot = plots[counter];
            series.push({ label: plot.label});
            points.push(plot.coordinates);
        }
        var plot1 = $.jqplot('param_chart_div', points, {
            title: 'Parameters',
            series: series,
            legend: { show: true}
        });
    }
});