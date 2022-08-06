// Common parameters. Ultimately, these need to be moved to a yaml file.

#pragma once

#include "relative_clock.hpp"

#include <stdexcept>
#include <string>

namespace ILLIXR {

struct display_params {
    // Display width in pixels
    static constexpr unsigned width = 2560;

    // Display height in pixels
    static constexpr unsigned height = 1440;

    // Display refresh rate in Hz
    static constexpr float frequency = 120.0f;

    // Display period in nanoseconds
    static constexpr duration period = freq2period(frequency);

    // Display horizontal field-of-view in degrees
    static constexpr float fov_x = 45.0f;

    // Display vertical field-of-view in degrees
    static constexpr float fov_y = 45.0f;

    // Inter-pupilary distance (ipd) in meters
    static constexpr float ipd = 0.064f;
};

/**
 * @brief Convert a string containing a (python) boolean to the bool type
 */
inline bool str_to_bool(std::string var) {
    return (var == "True") ? true
        : (var == "False") ? false
                           : throw std::runtime_error("Invalid conversion from std::string to bool");
}

/// Temporary environment variable getter. Not needed once #198 is merged.
inline std::string getenv_or(std::string var, std::string default_) {
    if (std::getenv(var.c_str())) {
        return {std::getenv(var.c_str())};
    } else {
        return default_;
    }
}

} // namespace ILLIXR
