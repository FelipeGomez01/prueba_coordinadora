enum Status { success, error, loading }

extension StatusExt on Status {
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
}