
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/models/bills_model.dart';
import 'package:shop_app/providers/sales_provider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/utils.dart';
import 'package:shop_app/widgets/atoms/dialog_atom.dart';
import 'package:shop_app/widgets/atoms/modal_general_atom.dart';
import 'package:shop_app/widgets/atoms/selected_filter_atom.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';
import 'package:shop_app/widgets/organisms/invoces_molecule.dart';


class BillTemplate extends StatefulWidget {
  static const int numItems = 5;

  @override
  State<BillTemplate> createState() => _BillTemplateState();
}

class _BillTemplateState extends State<BillTemplate> {

  ResponseStatusMolecule responseStatusMolecule = ResponseStatusMolecule();
  final TextEditingController controller = TextEditingController();


  ModalGeneralAtom modalGeneralAtom = new ModalGeneralAtom();
  BillModel billModel               = new BillModel();
  String filterClient               = "";
  String filterStatus               = "";
  String filterDate                 = "";
  TimeOfDay dateTime                 = TimeOfDay.now();

  final _horizontalScrollController = ScrollController();



  int _columnIndex = 0;
  bool _columnAscending = true;



  @override
  void initState() {
    context.read<SalesProvider>().findAll(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesProvider = Provider.of<SalesProvider>(context);
    return Column(
      children: [
        //Text(salesProvider.filterDate /*"Dia 12 - Mes 4 - Ano 2025"*/,style: TextStyle(color: Colors.green)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(Icons.filter_alt,color: Colors.amber,size: 50,),
              onTap: ()=>{
                modalGeneralAtom.dialogBuilder(context,height: 555, width: 410 ,content: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter cambiarEstado){
                        return Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 20,),
                                SelectedFilterAtom(
                                  list: billModel.generateListByFilter(salesProvider.listSales),
                                  title: "Cliente",
                                  action: (value)=>{
                                    filterClient = value
                                  },
                                ),
                                SizedBox(height: 20,),
                                SelectedFilterAtom(
                                  list: billModel.generateListByFilterString(["PAGO", "DEUDA"]),
                                  title: "Estado",
                                  action: (value)=>{
                                    filterStatus = value
                                  },
                                ),
                                SizedBox(height: 20,),
                                Text("Fecha Inicial"),
                                IconButton(
                                    onPressed: ()  =>{
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2025),
                                        lastDate: DateTime(3026),
                                        builder: (context, child){
                                          return Theme(data: ThemeData.dark(), child: child!);
                                        }
                                      ).then((value)=>{
                                        cambiarEstado(() {
                                          if(value == null) {
                                            filterDate = "Sin filtros";
                                          }else{
                                            salesProvider.filterDateInit = ("${value!.year}-${value!.month}-${value!.day}");
                                            filterDate = ("Dia ${value!.day} - Mes ${value!.month} - Año ${value!.year}");
                                          }
                                        }),
                                        showTimePicker(
                                          context: context,
                                          initialTime: dateTime
                                        ).then((value){
                                          cambiarEstado((){
                                            salesProvider.filterDateInit = "${salesProvider.filterDateInit} ${value!.hour}:${value.minute}:00";
                                            filterDate = "${filterDate} - Hora ${value.hour}:${value.minute}:00";
                                          });
                                        })
                                      })
                                    },
                                    icon: Icon(Icons.calendar_month_outlined)
                                ),
                                Material(
                                  elevation: 10,
                                  child: Container(
                                      width: 150,
                                      child: Text(filterDate ,style: TextStyle(color: Colors.green),)
                                  ),
                                ),
                                Text("Fecha Final"),
                                IconButton(
                                    onPressed: ()  =>{
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2025),
                                          lastDate: DateTime(3026),
                                          builder: (context, child){
                                            return Theme(data: ThemeData.dark(), child: child!);
                                          }
                                      ).then((value)=>{
                                        cambiarEstado(() {
                                          if(value == null) {
                                            return;
                                          }else{
                                            salesProvider.filterDateFinal = ("${value!.year}-${value!.month}-${value!.day}");
                                          }
                                        }),
                                        showTimePicker(
                                            context: context,
                                            initialTime: dateTime
                                        ).then((value){
                                          cambiarEstado((){
                                            salesProvider.filterDateFinal = "${salesProvider.filterDateFinal} ${value!.hour}:${value.minute}:00";
                                          });
                                        })
                                      })
                                    },
                                    icon: Icon(Icons.calendar_month_outlined)
                                ),
                              ],
                            ),
                            SizedBox(width: 40,),
                            Column(
                              children: [
                                IconButton(onPressed: ()=>{
                                  if(salesProvider.filterDateInit.isNotEmpty && salesProvider.filterDateFinal.isEmpty){
                                    Navigator.of(context).pop(),
                                    responseStatusMolecule.dialogBuilderCustomer(context,descriptin: "La fecha final esta vacia",icon: Icons.sd_card_alert)
                                  }else{
                                    salesProvider.filter(context, filterClient, filterStatus),
                                    filterStatus = "",
                                    filterClient = "",
                                    filterDate = "",
                                    salesProvider.filterDateFinal = "",
                                    salesProvider.filterDateInit = "",
                                    Navigator.of(context).pop(),
                                    if(salesProvider.listSales.isEmpty){
                                      responseStatusMolecule.dialogBuilderEmpty(context)
                                    }
                                  }

                                }, icon: Icon(Icons.send,color: Colors.green)
                                ),
                                /*IconButton(onPressed: ()=>{
                                    salesProvider.filterClean(context),
                                  }, icon: Icon(Icons.ac_unit, color: Colors.green,)
                                ),*/

                              ],
                            )
                          ],
                        );
                      }
                  ),

                )
                    ,title: "Filtra")
              },
            ),
            IconButton(onPressed: ()=>{salesProvider.filterClean(context)}, icon: Icon(Icons.ac_unit, color: Colors.green,size: 50,)),

            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: IconButton(onPressed: ()=>{

                if(salesProvider.listSalesFilter.isEmpty) {
                  responseStatusMolecule.dialogBuilderCustomer(
                    context,
                    icon: Icons.sim_card_alert_sharp,
                    descriptin: "Se debe aplicar un filtro para crear el PDF"
                  ),
                }else{
                  modalGeneralAtom.dialogBuilder(context, content: InvoicesMolecule(
                    listItems: billModel.generateListByInvoce(salesProvider.listSalesFilter),
                  ),title: "Generar PDF")
                }
              }, icon: Icon(Icons.picture_as_pdf, size: 50)),
            )
          ],
        ),



        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: salesProvider.listSales.length,
              itemBuilder: (_,int index){
                return
                  Visibility(
                    visible: salesProvider.listSales.isNotEmpty,
                    replacement: Center(child: Text("No hay datos para mostrar")),
                    child: Container(
                      width: 500,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        color: ColorsDefinitions.gray_second,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8,left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text("${salesProvider.listSales[index].productName}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(color: ColorsDefinitions.orange,fontSize: 20),),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text("${salesProvider.listSales[index].clientName}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(color: ColorsDefinitions.green,fontSize: 15),),
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorsDefinitions.green,
                                    ),
                                    child: Center(child: Text("${salesProvider.listSales[index].amount}")),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorsDefinitions.yellow,
                                    ),
                                    child: Center(child: Row(children: [
                                      SizedBox(width: 5,),
                                      Icon(Icons.monetization_on,),
                                      Text("${Utils.formatPriceCOL(salesProvider.listSales[index].price!.toInt())}")
                                    ],)),
                                  ),
                                  SizedBox(width: 15),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8,left: 15),
                              child: Row(
                                children: [
                                  Visibility(
                                      visible: salesProvider.listSales[index].pay!,
                                      replacement: Text("DEUDA",style: TextStyle(color: ColorsDefinitions.red),),
                                      child: Text("PAGO",style: TextStyle(color: ColorsDefinitions.green),)
                                  ),
                                  SizedBox(width: 20,),
                                  Text("${salesProvider.listSales[index].date}",style: TextStyle(color: ColorsDefinitions.gray),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
              }
          ),
        ),


      ],
    );
  }
}

