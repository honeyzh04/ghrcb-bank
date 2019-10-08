<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #l-map{height:100%;width:100%;}
        .control {
            width: 100%;
            top: 1%;
            left: 17%;
            position: absolute;
            z-index: 9999;
            BACKGROUND-COLOR: transparent;
        }
        #images{
            bottom:1%;
            right:1%;
            position:absolute;
            z-index:9999;
            BACKGROUND-COLOR: transparent;
        }
        #department{BACKGROUND-COLOR: transparent;}
    </style>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=x0baOoLE2m6N9QKwHcZv8e53"></script>
    <!--加载检索信息窗口-->
    <script type="text/javascript" src="https://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="https://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!--bootstrap-->
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <title>共和农商银行营销与维护</title>
</head>
<body>

<div id="l-map">

</div>
<div class="control">
        <div class="row">
            <input type="text" class="col-md-7 form-control"   id="department" placeholder="请输入管理部门名字">
            <button type="button" class="btn btn-primary col-md-2 text-left" onclick="search()" >搜索</button>
        </div>
</div>
</div>
<div>
    <img src="../img/bank/bank.png" id="images" width="75" height="75" />
</div>
</body>
</html>
<script type="text/javascript">
    
    $(document).ready(function (){
                 // 将标注添加到地图中
        findMap();
        findMark();
      

    });
    // 百度地图API功能
    var map = new BMap.Map("l-map");
    var poi = new BMap.Point(100.627015,36.281313);
    map.centerAndZoom(poi, 15);//设置中心点坐标和地图级别
    map.enableScrollWheelZoom(); //启用鼠标滚动对地图放大缩小

    // 添加带有定位的导航控件
    var navigationControl = new BMap.NavigationControl({
        // 靠左上角位置
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // LARGE类型
        type: BMAP_NAVIGATION_CONTROL_LARGE,
        // 启用显示定位
        enableGeolocation: true
    });
    map.addControl(navigationControl);
    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function(e){
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        alert("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);

    function search() {
        console.log("search")
        clearAll();
        findMap();
        findMark();
    }
    //删除路线
    function clearAll() {
        map.clearOverlays();

    }
    var  lng1="";
    var  lat1="";
    function findMap(){
        var department=$("#department").val();
        $.ajax({
            url:"../map/findMaps",
            data:{ "department":department},
            type:"POST",
            dataType:"json",
            success:function(obj){
                for (var i = 0; i < obj.length; i++) {
                    var a = new Array();
                    var obj1=obj[i];
                    for (var j = 0; j < obj1.length; j++) {
                        lng=obj1[j].lng;
                        lat=obj1[j].lat;
                        var color=obj1[j].color;
                        a.push(new BMap.Point(lng,lat));
                    }
                    var k=i;
                    k = new BMap.Polyline(a, {strokeColor:color, strokeWeight:6, strokeOpacity:0.5});
                    console.log(k)
                    map.addOverlay(k);          //增加折线
                }
            },
            error : function() {
                alert("请与管理员联系");
            }
        });
    }
    function findMark(){

        var department=$("#department").val();
        $.ajax({
            url:"../map/findMark",
            data:{ "department":department},
            type:"POST",
            dataType:"json",
            success:function(obj){
                for (var i = 0; i < obj.length; i++) {
                    lng1=obj[i].lng;
                    lat1=obj[i].lat;
                    var depart=obj[i].department;
                    var k=i;
                    var k = new BMap.Marker(new BMap.Point(lng1,lat1));  // 创建标注
                    map.addOverlay(k);
                    var label = new BMap.Label(depart,{offset:new BMap.Size(20,-10)});
                    label.setStyle({

                        color : "#9900ff", //字体颜色
                        fontSize : "12px",//字体大小 　　
                        backgroundColor :"0.05", //文本标注背景颜色　
                        border :"0",
                        fontWeight :"bold" //字体加粗

                    });
                    k.setLabel(label);
                }
            },

            error : function() {
                alert("请与管理员联系");
            }
        });
    }



/*
    function showOver(){
        marker.show(); polyline.show();
    }
    function hideOver(){
        marker.hide(); polyline.hide();
    }*/
</script>
