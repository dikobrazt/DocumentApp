//
// PermissionsDataManager.swift
//

import Permission

public class PermissionsDataManager: Resolvable {

    public init() { }

    public func requestPermission(_ permissionType: PermissionType,
                                  completion: @escaping (PermissionType.Status) -> Void) {
        permissionType.permissionValue.request { status in
            completion(status.permissionTypeStatus)
        }
    }

    public func verifyPermission(_ permissionType: PermissionType) -> PermissionType.Status {
        return permissionType.permissionValue.status.permissionTypeStatus
    }
}

private extension PermissionType {

    var permissionValue: Permission {
        switch self {
        case .notifications:
            return .notifications
        }
    }
}

private extension PermissionStatus {

    var permissionTypeStatus: PermissionType.Status {
        switch self {
        case .authorized:
            return .authorized
        case .notDetermined:
            return .notDetermined
        default:
            return .denied
        }
    }
}

public enum PermissionType {
    case notifications

    public enum Status {
        case authorized
        case notDetermined
        case denied
    }
}
