/**
 * 
 */
function Table(id, cols, titles) {
	this.id = id;
	this.cols = cols;
	this.titles = titles;
}

Table.prototype.view = function(jQuery, appendTo) {
	let tableHtml = ""
	tableHtml += `<table id="${this.id}">`
	tableHtml += `<thead>`
	tableHtml += `<tr>`
	for (let i = 0; i < this.titles.length; i++) {
		tableHtml += `<th>${this.titles[i]}</th>`
	}
	tableHtml += `<th class="result">result</th>`
	tableHtml += `</tr>`
	tableHtml += `</thead>`
	tableHtml += `<tbody>`
	tableHtml += `<tr>`
	for (let c = 0; c < this.cols; c++) {
		tableHtml += `<td><input type="text" name="${this.titles[c]}" /></td>`
	}
	tableHtml += `<td class="result"><input type="text" name="result" /></td>`
	tableHtml += `</tr>`
	tableHtml += `</tbody>`
	tableHtml += `</table>`
	jQuery(appendTo).append(jQuery(tableHtml))
}

Table.prototype.addRow = function(jQuery, tableElement) {
	let tableHtml = `<tr>`
	for (let c = 0; c < this.cols; c++) {
		tableHtml += `<td><input type="text" name="${this.titles[c]}" /></td>`
	}
	tableHtml += `<td class="result"><input type="text" name="result" /></td>`
	tableHtml += `</tr>`
	
	jQuery(tableElement).append(jQuery(tableHtml))
}

Table.prototype.addColumn = function(jQuery, tableElement, title) {
	this.titles.push(title)
	this.cols += 1

	let newTitle = `<th>${title}</th>`
	let column = `<td><input type="text" name="${title}" /></td>`
	
	jQuery(tableElement).find("thead").find("tr").each(function() {
		console.log(jQuery(this))
		console.log(jQuery(this).find(".result"))
		jQuery(this).find(".result").before( jQuery(newTitle) )
	})
	
	jQuery(tableElement).find("tbody").find("tr").each(function() {
		jQuery(this).find(".result").before( jQuery(column) )
	})
	
}

Table.prototype.toJson = function(jQuery, tableElement) {
	let json = [];
	jQuery(tableElement).find("tbody").find("tr").each(function() {
		let row = {}
		jQuery(this).find("td").each(function() {
			let input = jQuery(this).find("input");
			let name = input.attr("name");
			let val = input.val();

			if (isArray(val)) {
				row[name] = toArray(val);
			}
			else if (isNumber(val)) {
				row[name] = parseInt(val);
			}
			else if (isBool(val)) {
				row[name] = parseBool(val);
			}
			else {
				row[name] = val;
			}

		});
		json.push(row);
	})

	function isNumber(str) {
		let num = parseInt(str);
		return !isNaN(num);
	}

	function isArray(str) {
		return str.indexOf(",") >= 0;
	}

	function isBool(str) {
		return str == "true" || str == "false";
	}

	function parseBool(str) {
		return str == "true";
	}

	function toArray(str) {
		let arr = str.split(",");
		for (let i = 0; i < arr.length; i++) {
			if (isNumber(arr[i])) {
				arr[i] = parseInt(arr[i]);
			}
			else if (isBool(val)) {
				arr[i] = parseBool(arr[i]);
			}
		}
		return arr
	}

	return json;
}