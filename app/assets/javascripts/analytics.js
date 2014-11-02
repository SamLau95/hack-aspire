function ready() {
  var groups = [{'id': 0, 'group': 0, 'size': 3, 'avg': 20, 'users': [{'id':1,'score':10,'name':"test"}, {'id':1,'score':10,'name':"test"}]},
                {'id': 1, 'group': 1, 'size': 8, 'avg': 40, 'users': [{'id':1,'score':10,'name':"test"}, {'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"}]},
                {'id': 2, 'group': 3, 'size': 3, 'avg': 85, 'users': [{'id':1,'score':10,'name':"test"}, {'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"}]},
                {'id': 3, 'group': 4, 'size': 3, 'avg': 20, 'users': [{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"}]},
                {'id': 4, 'group': 5, 'size': 6, 'avg': 10, 'users': [{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"},{'id':1,'score':10,'name':"test"}]}];

  var margin = {top: 10, right: 10, bottom: 10, left: 10};
  var w = 500
  var h = 350
  var damper = 0.1

  var padding = 100;
  var svg = d3.select(".svg")
            .append("svg")
            .attr("width", w)
            .attr("height", h)
            // .append("g")
            // .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


  var fill_color = d3.scale.ordinal()
                  .domain([0, 100])
                  .range(["#d84b2a", "#beccae", "#7aa25c"]);

  var nodes =[];

  groups.forEach(function(d) {
    var node = {
      id: d.id,
      x: Math.random() * (w-padding*3),
      y: Math.random() * (h-padding*3),
      avg: d.avg,
      group: d.group,
      users: d.users,
      radius: d.size
    };
    nodes.push(node);
  });


  circle = svg.selectAll("circle")
              .data(nodes, function(d) { return d.id; });

  circle.enter()
        .append("circle")
        .attr("r", function(d) {
          return d.radius * 5;
        })
        .attr("stroke-width", 5)
        .attr("fill", function(d) { return fill_color(d.avg); })
        .attr("cx", function(d, i) { return d.x; })
        .attr("cy", function(d) { return d.y; })
        .on("mouseover", function(d, i) {show_details(d, i, this)})
        .on("mouseout", function(d, i) {hide_details(d, i, this)});

  // circle.transition().duration(2000).delay(500).attr("r", function(d) { return d.radius * 8; });

  function charge(d) {
    return -Math.pow(d.radius, 4.0) / 6;
  }

  function move_towards_center(alpha) {
    return function (d) {
      center_x = (w-padding)/2.0;
      center_y = (h-padding)/2.0;

      d.x = d.x + (center_x - d.x) * (damper + 0.02) * alpha;
      d.y = d.y + (center_y - d.y) * (damper + 0.02) * alpha;

    }
  }

  force = d3.layout.force()
            .nodes(nodes)
            .size([w, h]);

  force.gravity(-0.01)
        .charge(charge)
        .friction(0.9)
        .on("tick", function(e) {
            circle.each(move_towards_center(e.alpha))
                   .attr("cx", function(d) {return d.x;})
                   .attr("cy", function(d) {return d.y;});
        });

  force.start();

  function show_details(data, i, element) {
    d3.select(element).attr("stroke", d3.rgb(fill_color(data.avg)).darker());
    $("#group_info").text("Group " + data.group + " Students");
    $("#info").append("Average score: " + data.avg);

    $("#info").append("<ul class='list-group'>");

    data.users.forEach(function(d) {
      $("#info").append("<li class='list-group-item'>" + d.name + ": " + d.score + "</li>")
    });

    $("#info").append("</ul>");
  }

  function hide_details(data, i, element) {
    d3.select(element).attr("stroke", d3.rgb(fill_color(data.avg)));
    $("#info").text("");
    $("#group_info").text("Group Information");

  }
}

$(document).ready(ready);
$(document).on('page:load', ready);
