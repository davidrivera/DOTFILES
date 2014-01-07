// Copyright (c) 2010 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//翻译及解说:江湖一键客 
//日期:2011/9/1
function genericOnClick(info, tab) {
    alert("菜单ID为 " + info.menuItemId + "的菜单已被点击");
    alert("元素信息: " + JSON.stringify(info));
    alert("标签信息: " + JSON.stringify(tab));
}

//注释1:
//下面的数组是表示在什么样类型的元素(上下文)上点击才显示相应的菜单项，
//比如"link"类型则是当用户点击了超链接的时候才显示的菜单项。
//如果没有设置则无论在什么元素上面点击都会显示所创建的菜单项
var contexts = ["page", "selection", "link", "editable", "image", "video", "audio"];
for (var i = 0; i < contexts.length; i++) {
    var context = contexts[i];
    var title = "用户点击的是 '" + context + "' 类型元素时所展现的菜单项";
    //chrome.contextMenus.create方法说明:
    //"title":所标示的参数即是菜单项的名称,
    //"contexts":所表示的参数是菜单项在怎么样的上下文中显示,如注释1所示。
    //"onclick": 事件标示
    var id = chrome.contextMenus.create({
        "title": title,
        "contexts": [context],
        "onclick": genericOnClick
    });
}

//创建一个父菜单项和两个子菜单项
//chrome.contextMenus.create创建菜单后返回标识这个菜单的一个ID,在创建子菜单时要用到，请参见下面说明。
var parent = chrome.contextMenus.create({
    "title": "测试父菜单"
});
//和创建父菜单项一样的方法，只是多了一个"parentId"参数。
var child1 = chrome.contextMenus.create({
    "title": "子菜单 1",
    "parentId": parent,
    "onclick": genericOnClick
});
var child2 = chrome.contextMenus.create({
    "title": "子菜单 2",
    "parentId": parent,
    "onclick": genericOnClick
});
console.log("parent:" + parent + " child1:" + child1 + " child2:" + child2);

function radioOnClick(info, tab) {
    alert("单选菜单项 ID=" + info.menuItemId + "之前的状态:" + info.wasChecked + ")");
}
//创建一些单选(radio)菜单项,需要注意的是"type"所标示的参数为radio,如果忽略此参数则创建普通的菜单项
var radio1 = chrome.contextMenus.create({
    "title": "单选1(选中我之后前面会有一个小圆点)",
    "type": "radio",
    "onclick": radioOnClick
});
var radio2 = chrome.contextMenus.create({
    "title": "单选2(选中我之后前面会有一个小圆点)",
    "type": "radio",
    "onclick": radioOnClick
});

function checkboxOnClick(info, tab) {
    alert(JSON.stringify(info));
    alert("checkbox 菜单项ID: " + info.menuItemId + " 现在的状态: " + info.checked + "（之前的状态 " + info.wasChecked + ")");

}

//创建一些复选(checkbox)菜单项,需要注意的是"type"所标示的参数为checkbox,如果忽略此参数则创建普通的菜单项
var checkbox1 = chrome.contextMenus.create({
    "title": "Checkbox1",
    "type": "checkbox",
    "onclick": checkboxOnClick
});
var checkbox2 = chrome.contextMenus.create({
    "title": "Checkbox2",
    "type": "checkbox",
    "onclick": checkboxOnClick
});