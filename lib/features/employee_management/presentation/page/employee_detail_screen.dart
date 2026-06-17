import 'package:auto_route/annotations.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/widgets/wrapper/app_form_text_field.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/presentation/bloc/detail/employee_bloc.dart';
import 'package:zupa/features/employee_management/presentation/model/form/detail/employee_form.dart';

const mockEmployee = EmployeeEntity(
  id: 0,
  tenantId: 0,
  dateCreated: '2026-01-01',
  lastUpdated: '2026-01-01',
  modifiedBy: 'System',
  createdBy: 'System',
  code: 'EMP-000000',
  fullName: 'John Doe Senior',
  gender: 'Male',
  position: 'Senior Software Engineer',
  socialInsuranceCode: 'SI-0000000000',
  phoneNumber: '+1 234 567 890',
  email: 'john.doe@company.com',
  identityCard: '000000000000',
  issuePlaceIdentityCard: 'Main Police Department HQ',
  permanentAddress: '123 Main Street, Central District, Metropolis State',
  temporaryAddress: '456 Side Street, Secondary District, Metropolis State',
  isResigned: false,
  status: 'Active',
  staffMetaDataLevel: 'Level 3',
);

@RoutePage()
class EmployeeScreen extends StatefulWidget {
  final int employeeId;

  const EmployeeScreen({super.key, required this.employeeId});

  @override
  AppState<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends AppState<EmployeeScreen> {
  final refreshController = EasyRefreshController(
    controlFinishLoad: true,
    controlFinishRefresh: true,
  );
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        getIt<EmployeeBloc>()..add(FetchEmployee(.new(id: widget.employeeId))),
    child: EmployeeFormBuilder(
      model: .fromEntity(mockEmployee),
      builder: (context, formModel, child) =>
          BlocConsumer<EmployeeBloc, EmployeeState>(
            listener: (context, state) {
              switch (state) {
                case EmployeeInitial():
                  break;
                case EmployeeLoading():
                  break;
                case EmployeeLoadedSuccess():
                  refreshController.finishLoad();
                  refreshController.finishRefresh();
                case EmployeeLoadedError(:final errorMessage):
                  MessageHelper.showError(context, message: errorMessage);
                  refreshController.finishLoad(.fail);
                  refreshController.finishRefresh(.fail);
                case EmployeeEditing(:final employee):
                  formModel.updateValue(.fromEntity(employee));
                case EmployeeUpdating():
                  break;
              }
            },
            builder: (context, state) => AppScreen(
              isChildScrollable: true,
              title: state.isLoading
                  ? t.employeeManagement.profile.loading
                  : state.currentEmployee?.fullName ?? mockEmployee.fullName,
              appBarTrailing: [
                if (!state.isLoading)
                  IconButton(
                    icon: Icon(state.isEditing ? Icons.close : Icons.edit),
                    onPressed: () =>
                        context.read<EmployeeBloc>().add(const ToggleEditMode()),
                  ),
              ],
              child: Skeletonizer(
                enabled: state.isLoading,
                child: EasyRefresh(
                  controller: refreshController,
                  onRefresh: () => context.read<EmployeeBloc>().add(
                    FetchEmployee(.new(id: widget.employeeId)),
                  ),
                  header: const MaterialHeader(),
                  child: ListView(
                    padding: const .all(16.0),
                    children: [
                      // Profile Header Section
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                              child: state.currentEmployee?.avatarPath == null
                                  ? Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                    )
                                  : ExtendedImage.network(
                                      state.currentEmployee!.avatarPath!,
                                    ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.currentEmployee?.code ?? mockEmployee.code,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Chip(
                              label: Text(
                                state.currentEmployee?.status ??
                                    mockEmployee.status,
                              ),
                              backgroundColor:
                                  state.currentEmployee?.status.toLowerCase() ==
                                      'active'
                                  ? context.colorScheme.success
                                  : context.colorScheme.warning,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Section: Job Info
                      _buildSectionTitle(
                        context,
                        t.employeeManagement.sections.employmentDetails,
                      ),
                      const SizedBox(height: 8),
                      AppList(
                        items: [
                          _buildDetailField(
                            label: t.employeeManagement.fields.position,
                            formControl: formModel.positionControl,
                            fallbackValue:
                                state.currentEmployee?.position ??
                                mockEmployee.position,
                            isEditing: state.isEditing,
                            icon: Icons.work_outline,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.level,
                            formControl: formModel.staffMetaDataLevelControl,
                            fallbackValue:
                                state.currentEmployee?.staffMetaDataLevel ??
                                mockEmployee.staffMetaDataLevel,
                            isEditing: state.isEditing,
                            icon: Icons.layers_outlined,
                          ),
                          if (state.currentEmployee?.hireDate != null)
                            _buildDetailField(
                              label: t.employeeManagement.fields.hireDate,
                              fallbackValue:
                                  state.currentEmployee?.hireDate ??
                                  mockEmployee.hireDate!,
                              isEditing: state.isEditing,
                              icon: Icons.calendar_today_outlined,
                            ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Section: Contact Info
                      _buildSectionTitle(
                        context,
                        t.employeeManagement.sections.contactInformation,
                      ),
                      const SizedBox(height: 8),
                      AppList(
                        items: [
                          _buildDetailField(
                            label: t.employeeManagement.fields.fullName,
                            formControl: formModel.fullNameControl,
                            fallbackValue:
                                state.currentEmployee?.fullName ??
                                mockEmployee.fullName,
                            isEditing: state.isEditing,
                            icon: Icons.badge_outlined,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.email,
                            formControl: formModel.emailControl,
                            fallbackValue:
                                state.currentEmployee?.email ??
                                mockEmployee.email,
                            isEditing: state.isEditing,
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.phoneNumber,
                            formControl: formModel.phoneNumberControl,
                            fallbackValue:
                                state.currentEmployee?.phoneNumber ??
                                mockEmployee.phoneNumber,
                            isEditing: state.isEditing,
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Section: Personal & ID Info (Read-only System Registry)
                      _buildSectionTitle(
                        context,
                        t.employeeManagement.sections.legalDocuments,
                      ),
                      const SizedBox(height: 8),
                      AppList(
                        items: [
                          _buildDetailField(
                            label: t.employeeManagement.fields.identityCard,
                            fallbackValue:
                                state.currentEmployee?.identityCard ??
                                mockEmployee.identityCard,
                            isEditing: false,
                            icon: Icons.credit_card,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.taxCode,
                            fallbackValue:
                                state.currentEmployee?.taxCode ??
                                t.employeeManagement.fields.notAvailable,
                            isEditing: false,
                            icon: Icons.request_quote_outlined,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.socialInsurance,
                            fallbackValue:
                                state.currentEmployee?.socialInsuranceCode ??
                                t.employeeManagement.fields.notAvailable,
                            isEditing: false,
                            icon: Icons.health_and_safety_outlined,
                          ),
                          _buildDetailField(
                            label: t.employeeManagement.fields.permanentAddress,
                            fallbackValue:
                                state.currentEmployee?.permanentAddress ??
                                t.employeeManagement.fields.notAvailable,
                            isEditing: false,
                            icon: Icons.home_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
    ),
  );

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
      child: Text(
        title,
        style: AppTextStyles.titleSmall.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  AppListItem _buildDetailField({
    required String label,
    required String fallbackValue,
    required bool isEditing,
    required IconData icon,
    FormControl<String>?
    formControl, // Replaced control tracking with name strings
    TextInputType? keyboardType,
  }) {
    return (isEditing && formControl != null)
        ? AppListItem(
            padding: const .only(top: 16),
            content: AppFormTextField.form(
              control: formControl,
              errorText: t.common.errors.required,
              prefixIcon: icon,
              labelText: label,
            ),
          )
        : AppListItem(
            leading: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            text: fallbackValue,
          );
  }
}
