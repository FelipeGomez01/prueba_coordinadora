import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_coordinadora/core/domain/entities/guide_entity.dart';
import 'package:prueba_coordinadora/core/presentation/widgets/custom_app_bar.dart';
import 'package:prueba_coordinadora/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:prueba_coordinadora/theme/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailBloc = context.read<DetailBloc>();
    final guide = ModalRoute.of(context)!.settings.arguments! as GuideEntity;
    print(guide.guideStatus);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  guide.code,
                  style: AppTheme.textTheme.headline6!.copyWith(
                    color: AppTheme.primary.main
                  )
                ),
                Divider(color: AppTheme.primary.dark, thickness: 2)
              ]
            )
          ),
          Row(
              children: [
                const Spacer(),
                Container(
                    color: AppTheme.primary.main,
                    child: Row(
                      children: [
                        const Icon(Icons.directions_bus, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          guide.guideStatus,
                          style: AppTheme.textTheme.bodyText1!.copyWith(
                            color: Colors.white
                          )
                        )
                      ]
                    )
                )
              ]
          )
        ]
      )
    );
  }
}