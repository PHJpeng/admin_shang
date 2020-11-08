<?php

use think\facade\Route;

Route::group('v1/',function (){
    Route::post('sendCode', 'v1/user/sendCode');            //发送验证码
    Route::post('enterCode', 'v1/user/enterCode');          //登录注册
    Route::post('userInfo', 'v1/user/userInfo');			//用户信息
    Route::post('authorization', 'v1/user/authorization');  //获取用户信息 暂不启用
    Route::post('resetpwd', 'v1/user/resetpwd');			//忘记密码
    Route::post('resetpassword', 'v1/user/resetpassword');			//goodInfo
    Route::post('realName', 'v1/user/realName');			//实名认证
    Route::post('cancel', 'v1/user/cancel');			    //注销
    Route::post('recommender', 'v1/user/recommender');  //绑定推荐者
    Route::post('editHeadImg', 'v1/user/editHeadImg');  //修改头像
    Route::post('editNickName', 'v1/user/editNickName');  //修改昵称
    Route::post('messageList', 'v1/user/messageList');  //消息列表
    Route::post('messageInfo', 'v1/user/messageInfo');  //消息详情


    Route::post('config', 'v1/tool/config');  				//配置信息：任务规则、抽奖规则、客服信息
    Route::post('slider', 'v1/tool/slider');  				//配置信息：轮播图（banner、活动专栏、商学院）
    Route::post('task', 'v1/tool/task');  				//任务列表
    Route::post('retuenTable', 'v1/tool/retuenTable');  				//大转盘
    Route::post('getNum', 'v1/tool/getNum');  				//获取大转盘抽奖次数
    Route::post('agreement', 'v1/tool/agreement');  				//用户协议、隐私协议
    Route::post('kefu', 'v1/tool/kefu');  				//客服

    Route::post('task', 'v1/user/taskOfUser');              //我的任务
    Route::post('ranking', 'v1/user/ranking');              //排行榜

    Route::post('myCollect', 'v1/user/myCollect');       //我的收藏
//    Route::post('Addorcancelcollect', 'v1/user/Addorcancelcollect');       //我的收藏
    Route::post('category', 'v1/transaction/category');         //商品分类
    Route::post('shopCate', 'v1/transaction/shopCate');         //商家分类
    Route::post('merchant', 'v1/transaction/merchant');         //商家列表
    Route::post('news', 'v1/transaction/news');         //商家详情/新闻详情
    Route::post('goods', 'v1/transaction/goods');               //商品推荐、列表
    Route::post('goodInfo', 'v1/transaction/goodInfo');         //商品信息
    Route::post('collectgoods', 'v1/transaction/collectGoods'); //收藏商品

    Route::post('orderOfUser', 'v1/order/orderOfUser');      //用户订单列表
    Route::post('orderInfo', 'v1/order/orderInfo');          //订单详情
    Route::post('payMessage', 'v1/order/payMessage');      //返回订单总额和用户的金额
    Route::post('addOrder', 'v1/order/addOrder');          //添加订单
    Route::post('orderPay', 'v1/order/orderPay');      //支付订单
    Route::post('stopOrder', 'v1/order/stopOrder');          //取消订单
    Route::post('deleteOrder', 'v1/order/deleteOrder');          //删除订单

    Route::post('wallet', 'v1/user/wallet');      			//我的钱包
//    Route::post('integral', 'v1/user/integral');      		//积分纪录
    Route::post('signInfo', 'v1/user/signInfo');                //签到信息
    Route::post('signIn', 'v1/user/signIn');                //签到

    Route::post('taskend', 'v1/user/taskend');                //任务奖励
    Route::post('share', 'v1/user/share');                  //分享推广码
    Route::post('shareReward', 'v1/user/shareReward');      //推广奖励
    Route::post('extension', 'v1/user/extension');          //推广记录
    Route::post('transfer', 'v1/user/transfer');            //积分转账
    Route::post('membership', 'v1/user/membership');        //开通会员、高级会员
    Route::post('winningRecord', 'v1/user/winningRecord');  //中奖记录

    Route::post('addresslist', 'v1/address/addressList');                //地址列表
    Route::post('editaddress', 'v1/address/editAddress');                //添加地址、编辑地址都是这一个方法
    Route::post('deleteaddress', 'v1/address/deleteAddress');            //删除地址
    Route::post('getdefaultaddress', 'v1/address/getDefaultAddress');    //获取默认收货地址
    Route::post('getprovince', 'v1/address/getProvince');                //获取省列表
    Route::post('getnextcitylist', 'v1/address/getNextCityList');        //根据PID获取下级地址列表
})->middleware('check');

