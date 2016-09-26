include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/gorilla-audio-0.3.1)

vcpkg_download_distfile(ARCHIVE
    URL "https://github.com/playmer/gorilla-audio/archive/0.3.1.zip"
    FILENAME "gorilla-audio_0.3.1.zip"
    SHA512 4b7cc0685abbbaa9afced07eb7004961eb1db723f4d9904c4f02180adf53c235f29966bcdf6416db701a60cc1c5cc7004dd55ef8a3219f248064dd82b11ba3ea
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DENABLE_OPENAL=ON
)

vcpkg_build_cmake()
vcpkg_install_cmake()

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/share
)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share)
file(RENAME ${CURRENT_PACKAGES_DIR}/lib/gorilla-audio ${CURRENT_PACKAGES_DIR}/share/gorilla-audio)
file(RENAME ${CURRENT_PACKAGES_DIR}/debug/lib/gorilla-audio/libpng16-debug.cmake ${CURRENT_PACKAGES_DIR}/share/gorilla-audio/libpng16-debug.cmake)
file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/lib/gorilla-audio
)
file(COPY ${SOURCE_PATH}/COPYING.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/gorilla-audio)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/gorilla-audio/COPYING.txt ${CURRENT_PACKAGES_DIR}/share/gorilla-audio/copyright)
vcpkg_copy_pdbs()
