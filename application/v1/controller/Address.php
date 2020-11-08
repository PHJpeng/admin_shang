<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\controller;


use app\utils\AppCode;
use app\v1\service\AddressService;
use think\Controller;
use think\Request;

class Address extends Controller
{
    /**
     * 地址列表
     * @param Request $request
     * @return string
     */
    public function addressList(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = AddressService::addressList($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 添加地址、编辑地址
     * @param Request $request
     * @return string
     */
    public function editAddress(Request $request)
    {
        $param['type']          = $request->param('type');
        $param['area']          = $request->param('area');
        $param['name']          = $request->param('name');
        $param['mobile']        = $request->param('mobile');
        $param['address']       = $request->param('address');
        $param['addressId']     = $request->param('addressId');
        $param['is_default']    = $request->param('is_default');
        $param['address_name']  = $request->param('addressName');
        $param['authorization'] = $request->param('authorization');

        if(!$param['authorization'] || !$param['address'] || !$param['mobile'] || !$param['name'] || !$param['area'] || !$param['type']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = AddressService::editAddress($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 删除地址
     * @param Request $request
     * @return string
     */
    public function deleteAddress(Request $request)
    {
        $param['addressId']     = $request->param('addressId');
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization'] || !$param['addressId']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = AddressService::deleteAddress($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 获取默认收货地址
     * @param Request $request
     * @return string
     */
    public function getDefaultAddress(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = AddressService::getdefaultaddress($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 获取省列表
     * @param
     * @return string
     */
    public function getProvince()
    {
        $res = AddressService::getProvince();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 根据PID获取下级地址列表
     * @param Request $request
     * @return string
     */
    public function getNextCityList(Request $request)
    {
        $param['pid'] = $request->param('pid');
        if(!$param['pid']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = AddressService::getNextCityList($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }
}