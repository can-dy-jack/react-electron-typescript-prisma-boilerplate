import React, { useEffect, useState } from 'react';
import { Test } from '@prisma/client';
import { Button, Flex, Space, Table } from 'antd';
import { PlusOutlined, ReloadOutlined } from '@ant-design/icons';
import { useTableScroll } from '../hooks';

function Page() {
  const [data, setData] = useState<Test[]>([]);
  const [loading, setLoading] = useState(false);

  const getData = () => {
    setLoading(true);
    window.apis
      .getList()
      .then((res) => {
        setData(res);
        setLoading(false);
        return true;
      })
      .catch(() => {});
  };

  useEffect(() => {
    getData();
  }, []);

  const columns: any = [
    { title: 'id', dataIndex: 'id', width: 80 },
    { title: '名字', dataIndex: 'name', sorter: true },
    {
      title: '备注',
      dataIndex: 'comments',
      sorter: true,
    },
  ];

  const tableSrcollHeight = useTableScroll({ extraHeight: 100 });

  return (
    <div>
      <Flex gap="middle" vertical>
        <Flex align="center" gap="middle" justify="flex-end">
          <Space>
            <Button
              type="text"
              loading={loading}
              icon={<ReloadOutlined />}
              onClick={getData}
            />
            <Button type="primary" loading={loading} icon={<PlusOutlined />}>
              Add
            </Button>
          </Space>
        </Flex>
        <Table
          columns={columns}
          dataSource={data}
          loading={loading}
          rowKey="id"
          bordered
          scroll={{
            y: tableSrcollHeight,
          }}
        />
      </Flex>
    </div>
  );
}

export default Page;
