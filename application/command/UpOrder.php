<?php
/**
 * Created by PhpStorm.
 */

namespace app\command;

use app\model\OrderModel;
use app\v1_2\service\AlipayAndroidService;
use app\v1_2\service\OrderService;
use app\v1_2\service\WxpayandroidService;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class UpOrder extends Command
{
    protected function configure(){
        $this->setName('UpOrder')->setDescription("更新订单");
    }

    protected function execute(Input $input, Output $output)
    {
        $output->writeln("---执行开始---" );
        //查询未支付订单
        $order_m = new OrderModel();
        $where['status'] = OrderModel::STATUS_WAIT;
        $where['order_source'] = OrderModel::SOURCE_ANDROID;
        $order = $order_m->getList($where,'uuid as order_uuid,order_no,order_type,amount_actual,recharge_amount,pay_type,ctime');
        $output->writeln("共".count($order)."条未支付订单" );
        $wxpayandroid = new WxpayandroidService();
        foreach ($order as $val){
            if($val['pay_type'] == OrderModel::PAY_WECHAT){
                $wx_res = $wxpayandroid->queryOrderStatus($val['order_no']);
                if($wx_res["result_code"]=='SUCCESS' && $wx_res["return_code"]=='SUCCESS'){
                    if($wx_res['trade_state'] == 'SUCCESS'){
                        $param['out_trade_no'] = $wx_res['out_trade_no'];
                        $param['total_fee'] = $wx_res['cash_fee']/100;
                        OrderService::payConfirmOrder($param);
                    }elseif ($wx_res['trade_state'] == 'NOTPAY'){
                        if(time() - strtotime($val['ctime']) > 60*60*24){
                            $param['out_trade_no'] = $wx_res['out_trade_no'];
                            $param['total_fee'] = 0;
                            OrderService::payConfirmOrder($param);
                        }
                    }else{
                        $param['out_trade_no'] = $wx_res['out_trade_no'];
                        $param['total_fee'] = 0;
                        OrderService::payConfirmOrder($param);
                    }
                }else{
                    if(time() - strtotime($val['ctime']) > 50){
                        Db::table("app_order")->where(['uuid'=>$val['order_uuid']])->update(['status'=>OrderModel::STATUS_FAIL]);
                    }
                }
            }elseif ($val['pay_type'] == OrderModel::PAY_ALI){
                $ali_res = AlipayAndroidService::queryOrderStatus($val['order_no']);
                if(isset($ali_res['code']) && $ali_res['code'] == '10000'){
                    if($ali_res['trade_status'] == 'TRADE_SUCCESS'){
                        $param['out_trade_no'] = $ali_res['out_trade_no'];
                        $param['total_fee'] = $ali_res['total_amount'];
                        OrderService::payConfirmOrder($param);
                    }elseif ($ali_res['trade_status'] == 'WAIT_BUYER_PAY'){
                        if(time() - strtotime($val['ctime']) > 60*60*24){
                            $param['out_trade_no'] = $ali_res['out_trade_no'];
                            $param['total_fee'] = 0;
                            OrderService::payConfirmOrder($param);
                        }
                    }else{
                        $param['out_trade_no'] = $ali_res['out_trade_no'];
                        $param['total_fee'] = 0;
                        OrderService::payConfirmOrder($param);
                    }
                }else{
                    if(time() - strtotime($val['ctime']) > 50){
                        $param['out_trade_no'] = $ali_res['out_trade_no'];
                        $param['total_fee'] = 0;
                        OrderService::payConfirmOrder($param);
                    }
                }
            }
        }

        $output->writeln("---执行结束---" );
    }
}