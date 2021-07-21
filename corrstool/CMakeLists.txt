project(corres_resolve)
set(header common.h interact.h layout.h pickup_list.h render.h)
set(src interact.c keycallback.c layout.c main.c pick.c pickup_list.c render_infotext.c render_modes.c render_panels.c
../common/cholmod_wrapper.c ../common/constraint.c ../common/matrix3x3.c ../common/mesh_model.c 
../common/obj_file.c ../common/surface_matrix.c ../common/triangle_corr.c ../common/triangle_corr_dict.c ../gl_util/gl_util.c)

add_executable(corrstool ${src} ${header})
target_include_directories(corrstool PUBLIC ../gl_util ../common)
target_link_libraries(corrstool SuiteSparse::suitesparseconfig
SuiteSparse::amd
SuiteSparse::btf
SuiteSparse::camd
SuiteSparse::ccolamd
SuiteSparse::colamd
SuiteSparse::cholmod
SuiteSparse::cxsparse
SuiteSparse::klu
SuiteSparse::ldl
SuiteSparse::umfpack
SuiteSparse::spqr
# SuiteSparse::metis
${lapackblas_libraries} freeglut_static)




add_custom_command(TARGET corrstool POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${CMAKE_SOURCE_DIR}/ext/suitesparse-metis-for-windows/lapack_windows/x64"
    $<TARGET_FILE_DIR:corrstool>)
add_custom_command(TARGET corrstool POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
$<TARGET_FILE_DIR:corrstool>
    "${CMAKE_SOURCE_DIR}/bin2")