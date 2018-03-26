function renderChart(chartData) {
  let chart = new CanvasJS.Chart("chartContainer", {
    zoomEnabled: true,
    title: { text: "Spectrum" },
    axisY: { includeZero: false },
    toolTip: {
  		shared: true
  	},
    legend: {
  		cursor: "pointer",
  		verticalAlign: "top",
  		horizontalAlign: "center",
  		dockInsidePlotArea: true,
  	},
    data: chartData
  });

  chart.render();
}

function mapSpectrum(spectrum) {
  return spectrum.map(function(point) {
    return {
      x: parseFloat(point[0].replace(/,/, '.')),
      y: parseFloat(point[1].replace(/,/, '.')),
    }
  });
};

function chartSeries(measurment) {
  return {
    type: "line",
    name: getName(measurment),
    dataPoints: mapSpectrum(measurment.spectrum),
  }
};

function getName(measurment) {
  return `${measurment.pen_name || ""} | ${measurment.device_name || ""} | ${measurment.type}`
};
