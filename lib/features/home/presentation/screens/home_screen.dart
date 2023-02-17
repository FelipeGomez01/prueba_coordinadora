import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prueba_coordinadora/core/presentation/widgets/content_by_status.dart';
import '../../../../core/presentation/widgets/custom_app_bar.dart';
import '../../../../theme/theme.dart';
import '../../../../config/constants.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    String searchCriteria = '';
    bool isValidValue = false;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    Constants.labels.shipmentTracking,
                    style: AppTheme.textTheme.headline4!.copyWith(
                      color: AppTheme.primary.main
                    )
                  )
                ),
                Text(Constants.labels.homeDescription),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 25),
                    Text(Constants.labels.searchShipments)
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 15,
                    onChanged: (value){
                      searchCriteria = value;
                      isValidValue = searchCriteria.length >= 8;
                    },
                    decoration: InputDecoration(
                      labelText: Constants.labels.enterYourId,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if(isValidValue){
                            homeBloc.add(
                              SearchingEvent(identification: searchCriteria)
                            );
                          }
                        },
                        icon: Icon(Icons.search,color: AppTheme.primary.main)
                      )
                    )
                  )
                )
              ]
            )
          ),
          Expanded(
            child: BlocBuilder<HomeBloc,HomeState>(
              builder: (_,state) => ContentByStatus(
                status: state.homeStatus,
                errorMessage: state.message,
                onTryAgain: () => print('try again'),
                successBuilder: () => Column(
                  children: [
                    Divider(color: AppTheme.primary.dark,thickness: 2),
                    Row(
                      children: [
                        Text('${Constants.labels.shipmentsFound} (${state.guideList.length})'),
                        const Spacer(),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.filter_alt_outlined)
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.import_export)
                        )
                      ]
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_,__) => const Divider(
                          color: Colors.white,
                          height: 2
                        ),
                        itemCount: state.guideList.length,
                        itemBuilder: (_,i){
                          late final Color color;
                          late final IconData icon;
                          bool isNyS = false;
                          switch(state.guideList[i].guideStatus){
                            case 'En terminal destino': {
                              color = AppTheme.warning;
                              icon = Icons.warehouse;
                            }
                            break;

                            case 'En NyS': {
                              color = AppTheme.danger;
                              icon = Icons.warning;
                              isNyS = true;
                            }
                            break;

                            case 'Entregada': {
                              color = AppTheme.success;
                              icon = Icons.check_box;
                            }
                            break;

                            default: {
                              color = AppTheme.primary.main;
                              icon = Icons.directions_bus;
                            }
                            break;

                          }

                          return Slidable(
                            enabled: isNyS,
                            endActionPane: ActionPane(
                              extentRatio: 0.3,
                              motion: const ScrollMotion(),
                              children: [
                                InkWell(
                                  onTap: () => showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final roundedBorder = OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.black)
                                    );
                                    String solution = '';
                                    final now = DateTime.now();

                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.warning),
                                          Column(
                                            children: [
                                              const Text('Guía de rastreo:'),
                                              Text(state.guideList[i].code)
                                            ]
                                          )
                                        ]
                                      ),
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Fecha de reporte: ${state.guideList[i].noveltyDate!.day}/${state.guideList[i].noveltyDate!.month}/${state.guideList[i].noveltyDate!.year}'),
                                            Text('Fecha de solución: ${now.day}/${now.month}/${now.year}'),
                                            Divider(color: AppTheme.primary.light),
                                            TextField(
                                              onChanged: (value) => solution = value,
                                              maxLength: 150,
                                              maxLines: 5,
                                              style: AppTheme.textTheme.bodyText2!.copyWith(color: Colors.black),
                                                decoration: InputDecoration(
                                                  focusedBorder: roundedBorder,
                                                  enabledBorder: roundedBorder,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  counterStyle: const TextStyle(color: Colors.black)
                                                )
                                              ),
                                              ElevatedButton(
                                                onPressed: () =>
                                                  homeBloc.add(
                                                    ReportSolutionEvent(
                                                      index: i,
                                                      identification: searchCriteria,
                                                      solution: solution
                                                    )
                                                  ),
                                                  child: const Text('Reportar Solución')
                                                )
                                              ]
                                            )
                                          )
                                        );
                                      }
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.how_to_reg_outlined, color: Colors.black),
                                        Text('Revisar Problema')
                                      ]
                                    )
                                  )
                                ]
                              ),
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  Constants.routes.detail,
                                  arguments: state.guideList[i]
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 100,
                                      height: 150,
                                      alignment: Alignment.center,
                                      color: color,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.guideList[i].guideStatus,
                                            style: AppTheme.textTheme.subtitle1!.copyWith(
                                              color: Colors.white
                                            )
                                          ),
                                          const SizedBox(height: 5),
                                          Icon(icon, color: Colors.white)
                                        ]
                                      )
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 150,
                                        padding: const EdgeInsets.only(left: 15, bottom: 5),
                                        color: AppTheme.primary.light,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Spacer(),
                                                Container(
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color:  AppTheme.primary.dark,
                                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20))
                                                  ),
                                                  child: Text(
                                                    '${
                                                      state.guideList[i].shippingDate.day
                                                    }/${
                                                      state.guideList[i].shippingDate.month
                                                    }/${
                                                      state.guideList[i].shippingDate.year
                                                    }'
                                                  )
                                                )
                                              ]
                                            ),
                                            Text(
                                              Constants.labels.trackingGuide,
                                              style: AppTheme.textTheme.subtitle2,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              state.guideList[i].code,
                                              style: AppTheme.textTheme.headline4
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              Constants.labels.addressee,
                                              style: AppTheme.textTheme.subtitle2
                                            ),
                                            Text(state.guideList[i].destination.name)
                                          ]
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            );
                          }
                      )
                    )
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }
}