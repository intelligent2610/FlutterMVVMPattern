class CompleterResult<T>{
  final bool isSuccess;
  final String messages;
  final T dataResult;

  CompleterResult(this.dataResult,this.isSuccess,this.messages);
}