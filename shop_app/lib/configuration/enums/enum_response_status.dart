enum EnumResponseStatus {
  WAITING(status: "Espeando...",description: "Esperando respuesta."),
  SUCCESS(status: "Completado", description: "Operación completada con exito."),
  EMPTY(status: "Vacio", description: "No se encontraron datos."),
  ERROR(status: "Error", description: "Erros en la operación."),
  ERRORSERVIDOR(status: "ErrorServidor", description: "Erros en Servidor 500."),
  INITIAL(status: "Inicial", description: "Sin realizar operación");

  final String status;
  final String description;

  const EnumResponseStatus({required this.status, required this.description });

}

