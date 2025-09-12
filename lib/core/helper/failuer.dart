abstract class Failuer {
  final String errMessage;

  const Failuer(this.errMessage);
}

class ServerFailuer extends Failuer {
  const ServerFailuer(super.errMessage);
}
