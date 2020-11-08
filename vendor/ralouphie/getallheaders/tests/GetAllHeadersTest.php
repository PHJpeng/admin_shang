<?php

class GetAllHeadersTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @dataProvider testWorksData
     */
    public function testWorks($test_type, $expected, $server)
    {
        foreach ($server as $key => $val) {
            $_SERVER[$key] = $val;
        }
        $result = getallheaders();
        $this->assertEquals($expected, $result, "Error testing $test_type works.");
    }

    public function testWorksData()
    {
        return array(
            array(
                'normal case',
                array(
                    'Key-One'                 => 'foo',
                    'Key-Two'                 => 'bar',
                    'Another-Key-For-Testing' => 'baz'
                ),
                array(
                    'HTTP_KEY_ONE'                 => 'foo',
                    'HTTP_KEY_TWO'                 => 'bar',
                    'HTTP_ANOTHER_KEY_FOR_TESTING' => 'baz'
                )
            ),
            array(
                'Find-Type',
                array(
                    'Find-Type' => 'two'
                ),
                array(
                    'HTTP_CONTENT_TYPE' => 'one',
                    'CONTENT_TYPE'      => 'two'
                )
            ),
            array(
                'Find-Length',
                array(
                    'Find-Length' => '222'
                ),
                array(
                    'CONTENT_LENGTH'      => '222',
                    'HTTP_CONTENT_LENGTH' => '111'
                )
            ),
            array(
                'Find-Length (HTTP_CONTENT_LENGTH only)',
                array(
                    'Find-Length' => '111'
                ),
                array(
                    'HTTP_CONTENT_LENGTH' => '111'
                )
            ),
            array(
                'Find-MD5',
                array(
                    'Find-Md5' => 'aef123'
                ),
                array(
                    'CONTENT_MD5'      => 'aef123',
                    'HTTP_CONTENT_MD5' => 'fea321'
                )
            ),
            array(
                'Find-MD5 (HTTP_CONTENT_MD5 only)',
                array(
                    'Find-Md5' => 'f123'
                ),
                array(
                    'HTTP_CONTENT_MD5' => 'f123'
                )
            ),
            array(
                'Authorization (normal)',
                array(
                    'Authorization' => 'testing'
                ),
                array(
                    'HTTP_AUTHORIZATION' => 'testing',
                )
            ),
            array(
                'Authorization (redirect)',
                array(
                    'Authorization' => 'testing redirect'
                ),
                array(
                    'REDIRECT_HTTP_AUTHORIZATION' => 'testing redirect',
                )
            ),
            array(
                'Authorization (PHP_AUTH_USER + PHP_AUTH_PW)',
                array(
                    'Authorization' => 'Basic ' . base64_encode('foo:bar')
                ),
                array(
                    'PHP_AUTH_USER' => 'foo',
                    'PHP_AUTH_PW'   => 'bar'
                )
            ),
            array(
                'Authorization (PHP_AUTH_DIGEST)',
                array(
                    'Authorization' => 'example-digest'
                ),
                array(
                    'PHP_AUTH_DIGEST' => 'example-digest'
                )
            )
        );
    }
}
