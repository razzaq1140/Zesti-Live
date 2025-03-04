import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/videolive/model/filter_model.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/face_filters.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterWidgetBottomSheet extends StatefulWidget {
  const FilterWidgetBottomSheet({super.key});

  @override
  State<FilterWidgetBottomSheet> createState() =>
      _FilterWidgetBottomSheetState();
}

class _FilterWidgetBottomSheetState extends State<FilterWidgetBottomSheet> {
  int _selectedTabIndex = 0;
  double _progressValue = 0.0;
  double _sliderValue = 0.0;
  bool _isImageSelected = false;
  int selectedNumber = -1;

  final List<Map<String, dynamic>> _tabs = [
    {
      "icon": AppIcons.filter,
      "label": "Filter",
    },
    {
      "icon": AppIcons.face,
      "label": "Skin",
    },
    {
      "icon": AppIcons.faceScanner,
      "label": "Face",
    },
    {
      "icon": AppIcons.filter,
      "label": "",
    },
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
      _isImageSelected = false;
    });
    if (index == 2) {
      _showBottomSheet();
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const FaceFiltersBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _buildSliderWithLabel(),
          _buildCustomTabRow(),
          Expanded(
            child: IndexedStack(
              index: _selectedTabIndex,
              children: [
                _buildFilterGrid(),
                Center(child: _buildSlider()),
                const Center(child: Text('Face Options')),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(AppImages.disable),
                              height: 19,
                              width: 19),
                          const SizedBox(width: 10),
                          Row(
                            children: List.generate(5, (index) {
                              int number = index + 1;
                              bool isSelected = selectedNumber == number;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedNumber = number;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? colorScheme(context).onPrimary
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? colorScheme(context).onPrimary
                                          : Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text('$number',
                                        style: textTheme(context)
                                            .bodyMedium
                                            ?.copyWith(
                                              color: isSelected
                                                  ? colorScheme(context)
                                                      .onSurface
                                                  : colorScheme(context)
                                                      .onPrimary,
                                            )),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderWithLabel() {
    return Column(
      children: [
        if (_isImageSelected)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (_sliderValue * 100).toStringAsFixed(0),
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onPrimary),
              ),
              SizedBox(
                width: 350,
                child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildCustomTabRow() {
    return Row(
      children: List.generate(_tabs.length, (index) {
        final isSelected = _selectedTabIndex == index;
        return GestureDetector(
          onTap: () => _onTabSelected(index),
          child: Container(
            height: 50,
            width: 95,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.white,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _tabs[index]["icon"],
                  color: isSelected
                      ? colorScheme(context).onPrimary
                      : AppColor.textGrey,
                  height: 18,
                  width: 18,
                ),
                if (_tabs[index]["label"].isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Text(_tabs[index]["label"],
                      style: textTheme(context).bodySmall?.copyWith(
                          color: isSelected ? Colors.white : Colors.grey)),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildFilterGrid() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: filterList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _isImageSelected = true;
            });
          },
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(filterList[index].image!),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            filterList[index].text!,
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    filterList[index].text2!,
                    style: textTheme(context).bodySmall?.copyWith(
                        color: colorScheme(context).onPrimary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (_progressValue * 100).toStringAsFixed(0),
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(color: colorScheme(context).onPrimary),
          ),
          SizedBox(
            width: 300,
            child: Slider(
              thumbColor: colorScheme(context).onPrimary,
              activeColor: colorScheme(context).onPrimary,
              inactiveColor: AppColor.textGrey,
              value: _progressValue,
              min: 0.0,
              max: 1.0,
              onChanged: (newValue) {
                setState(() {
                  _progressValue = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
