////
///  OnboardingHeaderCellPresenter.swift
//

public struct OnboardingHeaderCellPresenter {

    static func configure(
        cell: UICollectionViewCell,
        streamCellItem: StreamCellItem,
        streamKind: StreamKind,
        indexPath: NSIndexPath,
        currentUser: User?)
    {
        if let cell = cell as? OnboardingHeaderCell,
            (header, message) = streamCellItem.type.data as? (String, String)
        {
            cell.header = header
            cell.message = message

            if needsHeightUpdate(cell, streamCellItem: streamCellItem) {
                streamCellItem.calculatedOneColumnCellHeight = cell.height()
                streamCellItem.calculatedMultiColumnCellHeight = cell.height()
                postNotification(StreamNotification.UpdateCellHeightNotification, value: cell)
            }
        }
    }

    private static func needsHeightUpdate(cell: OnboardingHeaderCell, streamCellItem: StreamCellItem) -> Bool {
        return streamCellItem.type.oneColumnHeight != cell.height() || streamCellItem.calculatedOneColumnCellHeight == nil || streamCellItem.calculatedOneColumnCellHeight! != cell.height()
    }
}
