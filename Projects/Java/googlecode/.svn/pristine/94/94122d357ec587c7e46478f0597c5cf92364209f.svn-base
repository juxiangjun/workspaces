package org.tju.ebs.domain.manager;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.rubyeye.xmemcached.*;

public class Memcached {

	private XMemcachedClient client;
	private final String host = "127.0.0.1";
	private final int port = 11211;
	private int expired = 0;

	public Memcached() {
		try {
			client = new XMemcachedClient(new InetSocketAddress(host, port));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean hasObject(String key) {
		return false;
	}

	public Object getObject(String key) {
		Object result = null;
		
		try {
			result = client.get(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List getObjects(Collection<String> keys) {
		List result = new ArrayList();
		try {
			Map<String, Object> map = this.client.get(keys);
			Iterator<?> it = keys.iterator();
			while (it.hasNext()) {
				result.add(map.get(it.next().toString()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void setObject(String key, Object instance) {
		
		try {
			client.set(key, this.expired, instance);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void remove(String key) {
		
		try {
			client.delete(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
