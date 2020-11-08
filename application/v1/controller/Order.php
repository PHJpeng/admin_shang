<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\controller;


use app\v1\service\OrderService;
use app\v1\service\UserService;
use think\Controller;
use app\utils\AppCode;
use think\Request;

class Order extends Controller
{
    /**
     * 用户订单
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function orderOfUser(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['type'] = $request->param('type', 7);
        $param['page'] = $request->param('page', 1);
        $param['length'] = $request->param('length', 10);
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::orderOfUser($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 用户订单详情
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function orderInfo(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['order_id'] = $request->param('order_id');
        if(!$param['order_id'] || !$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::orderInfo($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 返回订单总额和用户的金额
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function payMessage(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['order_id'] = $request->param('order_id');
        $param['good_price'] = $request->param('good_price');
        $param['post_fee'] = $request->param('post_fee', 0);
        $param['pay_num'] = $request->param('pay_num');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        if(!$param['order_id'] && !$param['good_price']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = OrderService::payMessage($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 添加订单
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function addOrder(Request $request)
    {
        $param['authorization'] = $request->param('authorization');//用户token
        $param['post_fee'] = $request->param('post_fee', 0);//邮费
        $param['remarks'] = $request->param('remarks', '');//备注
        $param['shipping_address'] = $request->param('shipping_address');//收货地址
        $param['good_id'] = $request->param('good_id');//商品ID
        $param['quantity'] = $request->param('quantity');//商品数量
        $param['good_title'] = $request->param('good_title');//商品标题
        $param['good_icon'] = $request->param('good_icon');//商品封面图
        $param['good_price'] = $request->param('good_price');//商品单价

        if(!$param['authorization'] || !$param['shipping_address'] || !$param['good_id'] || !$param['quantity'] ||
            !$param['good_title'] || !$param['good_icon'] || !$param['good_price']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::addOrder($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 支付订单
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function orderPay(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['order_id'] = $request->param('order_id');
        $param['order_number'] = $request->param('order_number');
        if(!$param['authorization'] || !$param['order_id']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::orderPay($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 取消订单
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function stopOrder(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['order_id'] = $request->param('order_id');
        if(!$param['authorization'] || !$param['order_id']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::stopOrder($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 删除订单
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function deleteOrder(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['order_id'] = $request->param('order_id');
        if(!$param['authorization'] || !$param['order_id']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = OrderService::deleteOrder($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }
}