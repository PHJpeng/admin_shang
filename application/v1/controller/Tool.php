<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\controller;


use app\v1\service\ToolService;
use think\Controller;
use app\utils\AppCode;
use think\Request;

class Tool extends Controller
{
    /**
     * 基础配置
     * @param
     * @return string
     */
    public function config()
    {
        $res = ToolService::config();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * banner
     * @param
     * @return string
     */
    public function slider()
    {
        $res = ToolService::slider();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
 * 任务
 * @param Request $request
 * @return string
 */
    public function task(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $res = ToolService::task($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 大转盘
     * @param Request $request
     * @return string
     */
    public function retuenTable(Request $request)
    {
        $param['authorization'] = $request->param('authorization');

        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = ToolService::retuenTable($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 获取大转盘抽奖次数
     * @param Request $request
     * @return string
     */
    public function getNum(Request $request)
    {
        $param['authorization'] = $request->param('authorization');

        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = ToolService::getNum($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 推广奖励
     * @param Request $request
     * @return string
     */
    public function shareReward(Request $request)
    {
        $param['authorization'] = $request->param('authorization');

        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = ToolService::shareReward($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 用户协议、隐私协议
     * @param
     * @return string
     */
    public function agreement()
    {
        $res = ToolService::agreement();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 客服
     * @param
     * @return string
     */
    public function kefu()
    {
        $res = ToolService::kefu();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }
}