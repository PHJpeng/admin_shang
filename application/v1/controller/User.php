<?php

namespace app\v1\controller;

use app\utils\AppCode;
use app\v1\service\UserService;
use think\Controller;
use think\Request;
use app\utils\Upload;
use think\facade\App;

class User extends Controller
{

    /**
     * 发送验证码
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/8
     */
    public function sendCode(Request $request)
    {
        if(!$request->has('mobile')){
            return $this->renderJson(AppCode::PARAM_ERROR,[],"请输入手机号");
        }else{
            $mobile = $request->param('mobile');
            //验证手机号
            $preg = preg_match("/^1[3456789]\d{9}$/", $mobile);
            if(!$preg)
            {
                return $this->renderJson(AppCode::MOBILE_ERRROR,[]);
            }
            //发送验证码
            $res = UserService::sendCode($mobile);
            if(isset($res['msg']))
            {
                return $this->renderJson(AppCode::MOBILE_VERCODE_FAIL,[],$res['msg']);
            }else{
                return $this->renderJson(AppCode::SUCCESS,$res['data'],'验证码发送成功');

            }
        }
    }

    /**
     * 登录/注册
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/26
     */
    public function enterCode(Request $request)
    {
        $param['mobile'] = $request->param('mobile');
        $param['pwd'] = $request->param('pwd');
        $param['code'] = $request->param('code');
        $param['usercode'] = $request->param('usercode');
        if(!$param['mobile'] || !$param['pwd']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::enterCode($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 授权接口
     * @param Request $request
     * @return string
     * @author userid
     * @date
     */
    public function authorization(Request $request)
    {
        $param['device_number'] = $request->param('device_number');
        if(!$param['device_number']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::authorization($param);
        if(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 用户信息
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/19
     */
    public function userInfo(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::userInfo($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 收藏列表
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/16
     */
    public function myCollect(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['page'] = $request->param('page',1);
        $param['length'] = $request->param('length',10);
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::myCollect($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 添加或取消收藏
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/16
     */
    public function addOrCancelCollect(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['goodid'] = $request->param('goodid');
        if(!$param['authorization'] || !$param['goodid']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::addOrCancelCollect($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 忘记密码
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/24
     */
    public function resetpwd(Request $request)
    {
        $param['mobile'] = $request->param('mobile');
        $param['pwd'] = $request->param('pwd');
        $param['agin_pwd'] = $request->param('agin_pwd');
        $param['code'] = $request->param('code');
        if(!$param['mobile'] || !$param['pwd'] || !$param['code'] || !$param['agin_pwd']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        if($param['agin_pwd'] != $param['pwd']){
            return $this->renderJson(AppCode::PARAM_ERROR,[],"两次输入密码不一致");
        }
        $res = UserService::resetpwd($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 修改密码
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/24
     */
    public function resetpassword(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['oldpwd'] = $request->param('oldpwd');
        $param['pwd'] = $request->param('pwd');
        $param['agin_pwd'] = $request->param('agin_pwd');
        if(!$param['authorization'] || !$param['oldpwd'] || !$param['pwd'] || !$param['agin_pwd']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        if($param['agin_pwd'] != $param['pwd']){
            return $this->renderJson(AppCode::PARAM_ERROR,[],"两次输入密码不一致");
        }
        $res = UserService::resetpassword($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 实名认证
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/24
     */
    public function realName(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['name'] = $request->param('name');
        $param['num'] = $request->param('num');
        $file = $request->file('file');

        if(!$param['authorization'] || !$param['name'] || !$param['num'] || !$file){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        if (is_idcard($param['num']) == false) {
            return $this->renderJson(AppCode::PARAM_ERROR,[],"身份证号输入错误");
        }

        if (!preg_match('/^([\xe4-\xe9][\x80-\xbf]{2}){2,4}$/', $param['name'])) {
            return $this->renderJson(AppCode::PARAM_ERROR,[],"真实姓名格式不正确");
        }

        if($file){
            $param['certificates'] = '/upload/' . Upload::upFile($file);
        }else{
            $param['certificates'] = '';
        }

        $res = UserService::realName($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 注销
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/24
     */
    public function cancel(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['remarks']       = $request->param('remarks');

        if(!$param['authorization'] || !$param['remarks']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::cancel($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 修改头像
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/24
     */
    public function editHeadImg(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $file = $request->file('file');
        if(!$param['authorization'] || !$file){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::editHeadImg($param,$file);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 修改昵称
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function editNickName(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['account'] = $request->param('account');
        $file = $request->file('file');
        if(!$param['authorization'] || !$param['account'] || !$file){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::editNickName($param, $file);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 修改手机号
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/5/25
     */
    public function editMobile(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['code'] = $request->param('code');
        $param['mobile'] = $request->param('mobile');
        if(isset($param['code'])){
            if(!$param['authorization'] || !$param['mobile']){
                return $this->renderJson(AppCode::PARAM_ERROR,[]);
            }
            $res = UserService::editMobile($param);
            if(isset($res['msg'])){
                return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],$res['msg']);
            }else{
                return $this->renderJson(AppCode::SUCCESS,$res['data']);
            }
        }else{
            return $this->renderJson(AppCode::MOBILE_VERCODE_NO,[],'验证码不正确');
        }
    }

    /**
     * 我的任务
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function taskOfUser(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::taskOfUser($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 排行榜
     * @paramRequest $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function ranking(Request $request)
    {
        $param['page'] = $request->param('start', 1);
        $param['length'] = $request->param('length', 10);
        $res = UserService::ranking($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * -我的钱包/积分纪录
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function wallet(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['page'] = $request->param('page', 1);
        $param['length'] = $request->param('length', 10);
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::wallet($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 签到信息
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function signInfo(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::signInfo($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 签到
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function signIn(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['continuity'] = $request->param('continuity', 1);
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::signIn($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 任务奖励
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function taskend(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
//        $param['isAdditional'] = $request->param('isAdditional');
        $param['species'] = $request->param('species');
        if(!$param['authorization'] || !$param['species']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::taskend($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 分享推广码
     * @param Request $request
     * @return string
     * @author userid
     * @date 2019/3/31
     */
    public function share(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }
        $res = UserService::share($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 推广记录
     * @param Request $request
     * @return string
     */
    public function extension(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['type'] = $request->param('type', 0); //0普通会员 1.高级会员
        $param['title'] = $request->param('title','');
        $param['page'] = $request->param('page',1);
        $param['length'] = $request->param('length',10);
        if(!$param['authorization']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::extension($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 积分转账
     * @param Request $request
     * @return string
     */
    public function transfer(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['nums'] = $request->param('nums');
        $param['touser'] = $request->param('touser');
        if(!$param['authorization'] || $param['nums'] || $param['touser']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        if($param['nums'] <= 0){
            return $this->renderJson(AppCode::ERROR,[],'请输入正确的数量!');
        }

        if (!preg_match('/^1[3456789]\d{9}$/', $param['touser'])){
            return $this->message(303,'请输入正确手机号!');
        }

        $res = UserService::transfer();
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 开通会员
     * @param Request $request
     * @return string
     */
    public function membership(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['touser'] = $request->param('touser');
        if(!$param['authorization'] || !$param['touser']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::membership($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 绑定推荐者
     * @param Request $request
     * @return string
     */
    public function recommender(Request $request)
    {
        $param['authorization'] = $request->param('authorization');
        $param['usercode'] = $request->param('usercode');
        if(!$param['authorization'] || !$param['usercode']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::recommender($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 消息列表
     * @param Request $request
     * @return string
     */
    public function messageList(Request $request)
    {
        $param['page'] = $request->param('page',1);
        $param['length'] = $request->param('length',10);

        $res = UserService::messageList($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

    /**
     * 消息详情
     * @param Request $request
     * @return string
     */
    public function messageInfo(Request $request)
    {
        $param['id'] = $request->param('id');
        if(!$param['id']){
            return $this->renderJson(AppCode::PARAM_ERROR,[]);
        }

        $res = UserService::messageInfo($param);
        if(isset($res['code']) && isset($res['msg'])){
            return $this->renderJson($res['code'],$res['data'],$res['msg']);
        }elseif(isset($res['msg'])){
            return $this->renderJson(AppCode::ERROR,[],$res['msg']);
        }else{
            return $this->renderJson(AppCode::SUCCESS,$res['data']);
        }
    }

}