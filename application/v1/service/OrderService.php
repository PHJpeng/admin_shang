<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\service;

use app\model\ToolModel;
use app\model\TaskModel;
use app\model\SliderModel;
use think\Controller;
use think\Db;
use think\Exception;
use think\facade\Cache;
use think\facade\Env;

class OrderService extends Controller
{
    /**
     * 用户订单
     * @param $param
     * @return array|mixed
     */
    public static function orderOfUser($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            //订单状态，10：创建成功未付款，20：已付款；30：等待发货；40：已发货；50：已完成；60：订单关闭取消',
            $condition['user_id'] = $user['userid'];
            switch ($param['type']) {
                case 7:
                    break;
                case 1:
                    $condition['order_status'] = 10;//创建成功未付款
                    break;
                case 2:
                    $condition['order_status'] = 20;//已付款
                    break;
                case 3:
                    $condition['order_status'] = 30;//等待发货
                    break;
                case 4:
                    $condition['order_status'] = 40;//已发货
                    break;
                case 5:
                    $condition['order_status'] = 50;//已完成
                    break;
                case 6:
                    $condition['order_status'] = 60;//订单关闭取消
                    break;
                default:
                    return ['msg'=>'订单参数错误'];
                    break;
            }

            $order = Db::table('ss_goods_order')
                ->field('order_id,create_time,total,order_number,order_status')
                ->where($condition)
                ->order('create_time desc')
                ->limit($start, $param['length'])
                ->select();//获取所有订单的数据

            foreach($order as $k=>$v){

                $goods_order_item = Db::table('ss_goods_order_item')
                    ->field('item_id,order_id,order_number,good_id,good_title,good_icon,good_price,quantity,total_price')
                    ->where(['order_id'=>$v['order_id'],'order_number'=>$v['order_number']])
                    ->select();//获取所以商品
                foreach($goods_order_item as $kk=>$vv){
//                    $path = Db::table('ss_goods_order_item g')
//                        ->join('ss_admin_upload a','g.good_icon = a.id')
//                        ->field('a.path')
//                        ->where('g.order_id',$vv['order_id'])
//                        ->find();//查找图片地址

                    $good = Db::table('ss_goods_order_item o')
                        ->join('ss_goods g','o.good_id = g.id')
                        ->field('g.market_price,g.conversion_price')
                        ->where('o.order_id',$vv['order_id'])
                        ->find(); //查找 市场价格 和 积分兑换价格
                    $goods_order_item[$kk]['path'] = isset($vv['good_icon']) ? Env::get('oss.READ_URL').$vv['good_icon'] : '';
                    $goods_order_item[$kk]['market_price'] = $good['market_price'];  //市场价格
                    $goods_order_item[$kk]['conversion_price'] = $good['conversion_price']; //积分兑换价格
                }
                $order[$k]['items'] = $goods_order_item;//把每个商品赋值给每个订单

            }

            return ['data' => $order];

        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 用户订单详情
     * @param $param
     * @return array|mixed
     */
    public static function orderInfo($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            $condition['o.user_id'] = $user['userid'];
            $condition['o.order_id'] = $param['order_id'];

            // 获取订单详情数据
            $result = Db::table('ss_goods_order o')
                ->join('ss_goods_order_item g','o.order_id = g.order_id')
                ->field('
                             o.order_id,
                             o.order_number,
                             o.total,
                             o.post_fee,
                             o.discount,
                             o.order_status,
                             o.create_time,
                             g.good_id,
                             g.good_title,
                             g.good_icon,
                             g.good_price,
                             g.quantity,
                             g.total_price'
                )
                ->where($condition)
                ->find();
            $result['good_icon'] = isset($result['good_icon']) ? Env::get('oss.READ_URL').$result['good_icon'] : '';
            if ($result){
                return ['data'=>$result];
            }else{
                return ['msg'=>'获取失败，请稍后重试!'];
            }

            return ['data' => $order];

        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 返回订单总额和用户的金额
     * @param $param
     * @return array|mixed
     */
    public static function payMessage($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $frozen_coin = Db::table('ss_store')->where('uid',$user['userid'])->value('frozen_coin');
            if(empty($frozen_coin)){
                return ['msg'=>'获取交易积分失败'];
            }
            $result['frozen_coin'] = $frozen_coin;

            if ($param['good_price']) {
                $result['total'] = (int)$param['good_price'] * (int)$param['pay_num'] + (int)$param['post_fee'];
                return ['data'=>$result];
            }

            $order = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id']])->value('total');
            if(empty($order)){
                return ['msg'=>'获取订单总价格失败'];
            }
            $result['total'] = $order;

            if ($result){
                return ['data'=>$result];
            }else{
                return ['msg'=>'获取失败，请稍后重试!'];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 添加订单
     * @param $param
     * @return array|mixed
     */
    public static function addOrder($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $total = 0;
            //获取库存
            $stock = DB::table('ss_goods')->where('id',$param['good_id'])->value('stock');
            // 判断库存
            if($param['quantity'] > $stock){
                return ['msg'=>'库存不足!'];
            }
            //求订单总订单的和
            $total += round(($param['good_price']*$param['quantity']),2);//订单总金额   订单中每个商品积分价格*对应数量再求和  实际上就是前段传过来的total

            // 启动事务
            Db::startTrans();

            $data['user_id'] = $user['userid'];//用户id
            $data['post_fee'] = $param['post_fee'];//邮费
            $data['remarks'] = $param['remarks'];//备注
            $data['shipping_address'] = $param['shipping_address'];//收货地址
            $data['create_time'] = time();//创建订单时间
            $data['order_status'] = 10; //订单状态，10：创建成功未付款，20：已付款；30：等待发货；40：已发货；50：已完成；60：订单关闭取消
            $data['order_number'] = createOrderNumber();//生成订单编号
            $data['total'] = (int)$total + (int)$param['post_fee'];// 订单总金额   商品总价格 = 商品总金额-(优惠金额+运费金额)
            $data['discount'] = 0.00;//优惠金额

            //插入订单表 --> 返回订单ID
            $orderId = DB::table('ss_goods_order')->insertGetId($data);
            //获取订单编号
            $goods_info = DB::table('ss_goods_order')->field('order_id,order_number')->where(['order_id'=>$orderId])->find();
            $goodIcon = str_replace(Env::get('oss.READ_URL'),"",$param['good_icon']);
            $detail['order_id'] = $orderId;//订单id
            $detail['order_number'] = $goods_info['order_number'];//订单编号
            $detail['good_id'] = $param['good_id'];//商品id
            $detail['good_title'] = $param['good_title'];//商品标题
            $detail['good_icon'] = $goodIcon;//商品封面图
            $detail['good_price'] = $param['good_price'];//商品积分价格  单价
            $detail['quantity'] = $param['quantity'];//商品数量
            $detail['total_price'] = (int)$total + (int)$param['post_fee'];// 订单中每个商品积分价格*对应数量再求和
            $detail['create_time'] = time();//
            $detail['discount'] = 0.00;//优惠金额

            //插入订单详情表
            $res = DB::table('ss_goods_order_item')->insert($detail);
            if(!$res && !$goods_info){
                // 回滚事务
                Db::rollback();
                return ['msg'=>'添加订单失败!'];
            }

            // 提交事务
            Db::commit();
            return ['data'=>$goods_info];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 支付订单
     * @param $param
     * @return array|mixed
     */
    public static function orderPay($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            //查找用户信息
            $me_info = Db::table('ss_user')->where(['userid'=>$user['userid']])->find();

            //查找用户钱包信息
            $store_info = Db::table('ss_store')->where(['uid'=>$user['userid']])->find();

            //获取订单支付总金额
            $total = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id'],'user_id'=>$user['userid']])->field('total,order_id')->find();

            //判断余额数量
            if($store_info['get_coin'] < $total['total']){
                return ['msg'=>'交易币的数量不足!'];
            }

            //判断订单支付总金额
            if(!$total){
                return ['msg'=>'订单错误，支付数据为空!'];
            }

            $time = time();

            // 启动事务
            Db::startTrans();
            //扣除用户冻结交易币
            $res = Db::table('ss_store')->where(['uid'=>$user['userid']])->setDec('get_coin',$total['total']);
            if(!$res){
                Db::rollback();
                return ['msg'=>'支付失败!'];
            }
            //判断用户支付状态为支付过提示不能再支付
            $res = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id'],'user_id'=>$user['userid']])->value('order_status');
            if($res==20){
                Db::rollback();
                return ['msg'=>'已经支付过 不能重复支付!!'];
            }
            //修改订单状态已支付
            $res = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id'],'user_id'=>$user['userid']])->update(['order_status'=>20,'payment_type'=>'coin','pay_time'=>$time]);
            if(!$res){
                Db::rollback();
                return ['msg'=>'支付失败!!'];
            }

            //获取商品ID 订单商品数量
            $good_order_item = Db::table('ss_goods_order_item')->where(['order_id'=>$param['order_id']])->field('good_id,quantity')->select();
            foreach($good_order_item as $k=>$v){
                //减去库存
                $res = Db::table('ss_goods')->where(['id'=>$v['good_id']])->setDec('stock',$v['quantity']);
                if(!$res){
                    Db::rollback();
                    return ['msg'=>'支付失败!!'];
                }

            }
            // 加入记录表  用户id  类型  内容  总金额  类型  绑定id
            $res = add_money_detail($user['userid'],'order','用户'.$me_info['username'].'购买商品订单支付'.$total['total'].'积分',-$total['total'],'frozen_coin',0);
            if(!$res){
                Db::rollback();
                return ['msg'=>'支付失败!!'];
            }

            $data['user_id'] = $user['userid'];//用户id
            $data['order_id'] = $param['order_id'];//订单ID
            $data['order_number'] = $param['order_number'];//订单编号
            $data['order_total_price'] = $total['total'];//订单支付总金额
            $data['create_time'] = time();//创建订单时间
            //插入用户订单记录表
            $res = DB::table('ss_user_order_pay_jilu')->insert($data);
            if(!$res){
                Db::rollback();
                return ['msg'=>'支付失败!!'];
            }

            // 提交事务
            Db::commit();
            return ['data'=>[]];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 取消订单
     * @param $param
     * @return array|mixed
     */
    public static function stopOrder($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);
            //获取用户的订单
            $order_status = Db::table('ss_goods_order')->where(['user_id'=>$user['userid'],'order_id'=>$param['order_id']])->field('order_status,order_id')->find();
            // 如果订单已支付 就不能取消订单
            if($order_status['order_status'] == 20){
                return ['msg'=>'订单ID为'.$order_status['order_id'].'的订单已支付,不能取消订单!'];
            }
            if($order_status['order_status'] == 60){
                return ['msg'=>'订单已取消'];
            }

            $result = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id']])->update(['order_status'=>60]);
            if ($result){
                //获取商品ID 订单商品数量
                $good_order_item = Db::table('ss_goods_order_item')->where(['order_id'=>$param['order_id']])->field('good_id,quantity')->select();
                foreach($good_order_item as $k=>$v){
                    //获取商品的库存和商品标题
                    $good_data = Db::table('ss_goods')->where('id',$v['good_id'])->field('stock,title')->find();
                    //取消订单时 把订单数量补回到 库存
                    $res = Db::table('ss_goods')->where(['id'=>$v['good_id']])->setInc('stock',$v['quantity']);
                    if(!$res){
                        return ['msg'=>'取消订单失败'];
                    }

                }
                return ['data'=>[]];
            }else{
                return ['msg'=>'取消订单成功'];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 删除订单
     * @param $param
     * @return array|mixed
     */
    public static function deleteOrder($param)
    {
        try{
            $user = json_decode(base64_decode($param['authorization']),true);

            $order_status = Db::table('ss_goods_order')->where(['user_id'=>$user['userid']
            ,'order_id'=>$param['order_id']])->value('order_status');
            if($order_status == 20){
                return ['msg'=>'订单已支付,不能删除!'];
            }

            $res1 = Db::table('ss_goods_order')->where(['order_id'=>$param['order_id']])->delete();
            $res2 = Db::table('ss_goods_order_item')->where(['order_id'=>$param['order_id']])->delete();
            if ($res1 && $res2){
                return ['data'=>[]];
            }else{
                return ['msg'=>'操作失败，请稍后重试!'];
            }
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }
}