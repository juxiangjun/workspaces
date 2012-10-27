package org.tju.ebs.domain.manager;

import org.tju.ebs.utils.DateUtil;

public abstract class BaseManager {

	private Memcached mc;

	public Memcached getMc() {
		return mc;
	}

	public void setMc(Memcached mc) {
		this.mc = mc;
	}

	public boolean isNewObject(String createdDate) {
		boolean result = false;
		try {
			DateUtil date = new DateUtil(createdDate);
			DateUtil du = new DateUtil();
			int diff = date.getNow().compareTo(du.getNow());
			if (diff >= 0 && diff < 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
