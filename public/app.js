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
    update_orders_input();
}

// функция возвращает кол-во элементов в заказе клиента
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

//функция апдейта контрола ввода для передачи строчки заказа через форму
function update_orders_input()
{
    var orders = "Корзина (" + count_items() + ")";
    $('#orders_button').val(orders);      // # - означает что мы обращаемся к элементу по id
}

//функция апдейта контрола ввода для передачи строчки заказа через форму
function update_cart_button()
{
    var orders = get_orders();
    $('#orders_input').val(orders);      // # - означает что мы обращаемся к элементу по id
}

//функция возвращает строку заказа клиента
function get_orders()
{
    var sum = "";
    for (var i = 0, len = localStorage.length; i < len; i++)
    {
        var key = localStorage.key(i);
        if (key.indexOf("product_") == 0)    // функция indexOf возвращает номер в строке с которого начинается искомое сочетание
        {
            var value = localStorage[key];
            sum = sum + key + "=" + value + ",";
        }
    }
    return sum;
}
