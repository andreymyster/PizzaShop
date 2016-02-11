function something()
{
    var x = window.localStorage.getItem('aaa');
    x = x * 1 + 1;
    window.localStorage.setItem('aaa', x);
    alert(x);
}

function add_to_cart(id)
{
    var key = 'product_' + id;
    var x = window.localStorage.getItem(key);
    x = x * 1 + 1;
    window.localStorage.setItem(key, x);
}

function count_items()
{
    var sum = 0;
    for (var i = 0, len = localStorage.length; i < len; i++)
    {
        var key = localStorage.key(i);
        if (key.indexOf("product_") == 0)    // функция indexOf возвращает номер в строке с которого начинается искомое сочетание
        {
            var value = localStorage[key] * 1;
            sum = sum + value;
        }
    }
    return sum;
}
