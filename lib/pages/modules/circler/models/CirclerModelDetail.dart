import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// 文章详情数据结构
class CirclerModelDetail {

	String name;
	List<CirclerModelNewsItem> news = [];
	bool hasmore;
	int total;

	CirclerModelDetail();

	CirclerModelDetail.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic resultData) {
		dynamic result = resultData['data'];
		var errmsg = result['errno'];

		if (result != null && errmsg == 0) {
			dynamic resultSubData = result['data'];
			dynamic news = resultSubData['news'];
			for(Map item in news) {
				CirclerModelNewsItem itemData = new CirclerModelNewsItem();
				itemData.update(item);
				this.news.add(itemData);
			}
		}
		this.name = 'updated!';
	}
}
