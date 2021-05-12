abstract class MyCoinEvents {}

class MyCoinEventList extends MyCoinEvents{
  String ids;
  String filterList;
  MyCoinEventList({this.ids, this.filterList});
}


class MyCoinSearchFilter extends MyCoinEvents{
  String filterText;
  MyCoinSearchFilter({this.filterText});
}
