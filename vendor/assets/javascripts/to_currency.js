Number.prototype.toCurrency = function () {
  var match, cents, dollars, result;

  match = (Math.round(this*100)/100).toString().match(/^-?(\d+)(\.\d+)?$/);
  if (!match) return;

  cents = match[2] ? (match[2] + '00').substr(1, 2) : '00';
  dollars = match[1].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1.');

  result = 'R$ ' + dollars + ',' + cents;
  if (this < 0) {
    result = '-' + result;
  }
  return result;
};
