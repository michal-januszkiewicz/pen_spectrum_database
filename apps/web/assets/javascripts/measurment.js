$(function() {
  const checkedMeasurmentsNumber = 3;
  const allMeasurmentsNumber = 18;
  const columnsNumber = 3;
  const measurmentsPerColumn = allMeasurmentsNumber / columnsNumber;
  const measurment_id = $("#find-similar").attr("data-id");
  const currentMeasurment = JSON.parse($('#current-measurment')[0].innerHTML);
  const mainSpectrum = chartSeries(currentMeasurment);
  let similarList = $("#similar")
  let chartData = [mainSpectrum];
  let originalchartData = [];

  renderChart(chartData);

  $("#find-similar").click(function() {
    $.get("find_similar", { id: measurment_id, range: getRange() }, function(data) {
      measurments = JSON.parse(data)
      similarList.html("");
      if (measurments.length === 0) {
        similarList.html(
          '<p style="color: red;">No similar measurments found for current type</p>'
        );
      } else {
        displaySimilarMeasurments(measurments);
        renderChart(chartData);
      }
    });
  });

  $("#similar").on("change", ".similar-spectrum", function() {
    let index = $(this).attr("data-index");
    if ($(this).find("input")[0].checked) {
      chartData[index].dataPoints = originalchartData[index - 1];
    } else {
      chartData[index].dataPoints = [];
    }
    renderChart(chartData);
  });

  function displaySimilarMeasurments(measurments) {
    chartData = [mainSpectrum];
    originalchartData = [];
    columns = _.chunk(measurments, measurmentsPerColumn);

    columns = columns.reduce(function(array, column, i) {
      column = column.reduce(function(list, measurment, j) {
        const index = i * measurmentsPerColumn + j;
        list.append(listItem(index, measurment));
        addMeasurmentToChartData(index, measurment);
        return list;
      }, $('<ul class="pull-left"></ul>'));
      array.push(column);
      return array;
    }, []);

    columns.forEach(function(column) {
      similarList.append(
        $('<div class="col-md-4"></div>').append(column)
      );
    });
  };

  function listItem(index, measurment) {
    const checked = index < checkedMeasurmentsNumber ? true : false;
    const checkedString = checked ? "checked=true" : "";
    let text = listItemText(measurment);
    return $(
      `<li class="similar-spectrum" data-index=${index + 1}>
        <label><input type="checkbox" ${checkedString} /> ${index + 1}. ${text}</label>
      </li>`
    );
  };

  function addMeasurmentToChartData(index, measurment) {
    originalchartData.push(mapSpectrum(measurment.spectrum));
    if (index >= checkedMeasurmentsNumber) measurment.spectrum = [];
    chartData.push(chartSeries(measurment));
  };

  function listItemText(measurment) {
    return `
      ${measurment.pen_name} | ${measurment.device_name} | ${measurment.type} | ${measurment.date}
    `
  };

  function getRange() {
    let from = $("#range-from").val();
    let to = $("#range-to").val();
    from = from === "" ? 0 : from;
    to = to === "" ? 10000 : to;
    return [from, to];
  };
});
