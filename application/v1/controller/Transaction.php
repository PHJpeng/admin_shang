<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\controller;


use app\utils\AppCode;
use app\v1\service\TransactionService;
use think\Controller;
use think\Request;

class Transaction extends Controller
{
    /**
     * 商品分类
     * @param
     * @return string
     */
    public function category()
    {
        $res = TransactionService::category();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 商家分类
     * @param
     * @return string
     */
    public function shopCate()
    {
        $res = TransactionService::shopCate();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 商家列表
     * @param Request $request
     * @return string
     */
    public function merchant(Request $request)
    {
        $param['type']  = $request->param('type', 1);
        $param['title']  = $request->param('title');
        $param['page']  = $request->param('start', 1);
        $param['length'] = $request->param('length', 10);

        $res = TransactionService::merchant($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 商家详情/新闻详情
     * @param Request $request
     * @return string
     */
    public function news(Request $request)
    {
        $param['shopid'] = $request->param('shopid');
        if(!$param['shopid']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = TransactionService::news($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 商品列表，推荐商品，搜索商品
     * @param Request $request
     * @return string
     */
    public function goods(Request $request)
    {
        $param['type']    = $request->param('type');
        $param['cate']    = $request->param('cate');
        $param['page']    = $request->param('page', 1);
        $param['length']  = $request->param('length', 10);
        $param['keyword'] = $request->param('keyword');
        if(!$param['type']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = TransactionService::goods($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 商品详情
     * @param Request $request
     * @return string
     */
    public function goodInfo(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['goodid'] = $request->param('goodid');
        if(!$param['goodid']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = TransactionService::goodInfo($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 收藏商品
     * @param Request $request
     * @return string
     */
    public function collectGoods(Request $request)
    {
        $param['goodid']        = $request->param('goodid');
        $param['authorization'] = $request->param('authorization');
        if(!$param['goodid'] || !$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = TransactionService::collectGoods($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }
}