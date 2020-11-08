<?php
/**
 * Created by PhpStorm.
 */
namespace app\utils;

class AppCode
{

    /**
     * @var array
     * 提示码统一写在这里
     * 10001 用户系统开始
     *
     * 以后再有就继续添加
     */

    const SUCCESS = '2000';
    const PARAM_ERROR = '2001';
    const ERROR = '2002';
    const NOT_FOUND = '4004';
    const IS_EXIST = '2005';
    const AUTH_INVALID = '-1';
    const TOKEN_FAIL = '-2';

    /*
     * 用户系统
     */
    const MOBILE_ERRROR = '10001';
    const USER_SAVE_FAIL = '10002';
    const USER_GET_NULL = '10003';
    const USER_TOKEN_NULL = '10004';
    const MOBILE_VERCODE_FAIL = '10005';
    const MOBILE_VERCODE_NO = '10006';
    const RESET_PASSWORD_FAIL = '10007';
    const USER_INFO_INVALID = '10008';
    const NICK_NAME_NOT_RULE = '10009';
    const HEAD_ICO_NOT_RULE = '100010';
    const USET_CANCEL_APPLY = '100011';//用户申请注销中
    const USER_NO_EXIST = '420001';


    public static $msgs = [

        self::SUCCESS => '请求成功',
        self::ERROR => '操作失败，请重试',
        self::NOT_FOUND => '没有数据',
        self::PARAM_ERROR =>'参数异常!',
        self::AUTH_INVALID => 'auth失效',
        self::TOKEN_FAIL =>'验签失败',

        //用户系统
        self::MOBILE_ERRROR => '请输入正确的手机号',
        self::USER_SAVE_FAIL => '用户保存失败',
        self::USER_TOKEN_NULL => 'userToken为空',
        self::USER_INFO_INVALID => '用户信息失效，请重新登录',

    ];
}