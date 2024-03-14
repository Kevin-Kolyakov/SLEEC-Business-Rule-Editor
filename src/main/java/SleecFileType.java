import com.intellij.openapi.fileTypes.LanguageFileType;
import com.intellij.openapi.util.IconLoader;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public final class SleecFileType extends LanguageFileType {
    public static final SleecFileType INSTANCE = new SleecFileType();

    private SleecFileType() {
        super(SleecLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public String getName() {
        return "SLEEC File";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "SLEEC business rule language file";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "sleec";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return IconLoader.getIcon("/resources/META-INF/pluginIcon.svg", SleecFileType.class);
    }

}
