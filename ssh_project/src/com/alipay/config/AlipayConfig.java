package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092300577362";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCInhoTk33mxkyLDZ3zLhjriV/Lsz9RdEwkmaG9sO1Dky3YWFF8obfYHofZE8wFaGKc1LxUgUE8n+iVA0Lc0+TeSVwSkGXFCXRaOtIbD+Y5kTGuAHxmQyVXhXoJgGqpqqIuGGY4Ds31FNRC8WCtR0b0zguZ2kfoibBTEMgaX7ZYmickOZyP0H36NT/iHstNUGigp/GK7jyPT4d9bipFxigAC1ziVUWUHOgs1rTgsBKcTpHqo3Pb8DEl1TTAMcEg6rLu6L1jwux4T3uqctTxD0e47L/Laq1YmlXG4QYcA1QWj+hQ0iOv+zpymIsIClgyoYNpSxABj4BpGHYZtW8yaPyLAgMBAAECggEAUVBA1wv/cL7wSgdlzprOTEqskNJ0Smf89f/XC89luMW+ELmobpTWlrS9SJAG6+UQZKYeHfH8wTewOBkDz+nym/dv7MCzQg55iUbfTSoubm8j8ZvqbvdiH3CbjVI4qhmcg/ETziPJpCismdePIjN9YTHOJ9mK2TYyk442e7QiFSNylVjvCO3odsBZfiXxE14wkOMKmo77m8rWGYj3PuLuYTNWNnJl2lni68HDGc26wDs4h+rggOUJR8F+ng2PUUPGKrVYaETglSiZW69yUgqf6RgCUYRuO7TLmxq6sVcT4OJDRq7cyMN8VqENSVZcsDe/gYdPrGpV9gcvvFDdxKYwGQKBgQDWi1atgKVPtEIELe3CdCH4OXxh8doHe/6zLMZOhLXxCzL0LyFOWhJ9o8Vtu/8wRxvctV+h6EnYfBxa6BH1DCn+xFAjyK5/EeW2Fkz4U6H8UBoFctTZ6s7udFFvdxJYbuL+5fdoQDa7iZaGaHkEASt2Pu33Z+XXPHRI40xKiEXJ5wKBgQCjBAkzIXx1wkQqZOiXbrPo4noaUIdM3GhK4o4+qIy2K9ngWaDRAYJl01lH2t9OfXSKxyE7ElWgtk3/XhDWfbMrDqJ5+ZqOB9p122PFEg6ZM5/m5Edcd+oVTmkyWWdRU+EL7qMVAoTz7Scw5ptqeiLXiAz0dBVXw/Yx7ZCbBFoLvQKBgFYuhtUPdlh8GoC/SmDwcazausJFesXC419qPwbPfJ6lVwSL4h8tQ3xAy0/3Ut07009ndFD/lJpn0KQb0QrUphH3HhIhzSayM8pfTu/5+Hn4W1uQ8zvOfO2AwC28cRwg/wJRsn6oPNQ8wsCfOu2G4sSPJtxZWhSJ7lRRKhZOg2pFAoGAJFzzHGe81pvWDsrho137XdifOh16gOetj/7HkiyQ7tYLTONRXy4CA2rIwKGPLHgJtidDP2UQmr/v2CYIhYAWpmUmUyUdl88iqSWeNMiZXw1H/v4u+O561fPevW95/4dBbSL3V+lu9OaS1nKqem7yNLfRg/odBK3ezjZbCmlHGNUCgYEAysGkKa5ehqpU0moXkBNn3KIsRs5nw8Kq45QvKXpe/IQnzHp3PJUl5r8UUqZlyAp33gza/DCkvUR9zPW+V9dKSgKtkFo/pNPvv9CVRz5eqaez3GrDeg2dg09SM4rrdK2SlSE3wh2GsW6UTAYj40m+OI9v+BIHVqVKsxtnepo4qlY=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxZAJU9+VqDmqDqewj/wU5wf8oaErYBSU4mjnGpcSzAJpVRSSAqGhqjeD9X2ek6dmdoj8AqT6h2Su+qJ2/HvPWfcljne3xtMEV30MilbNh5jWDR8fs3PGQSfco35MA2kM4oC2UvNHP2t41UGB5LToRQx1889omUDfx0pRnGgELfSkoeFP1588ozEkTfmK793yu5/Ha/TolueDxEr3Jb2PiKZf/Q5GeMndpi4A5V648wtRcjfmB2TZaFNemPFvNkYDVutWa1K96rcULqjbLcGx7Fjx88wkfhjnr9sexsqipwBk6OCTTUYfUycTwQG4/TRZVGJN9rRl/tcM5iwXzsd9BQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/ssh_project/pay/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/ssh_project/pay/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

