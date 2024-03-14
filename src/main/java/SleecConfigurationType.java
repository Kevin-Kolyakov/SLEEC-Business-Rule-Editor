import com.intellij.execution.configurations.ConfigurationTypeBase;
import com.intellij.openapi.util.IconLoader;

public class SleecConfigurationType extends ConfigurationTypeBase {
    public SleecConfigurationType() {
        super("SLEECConfiguration", "SLEEC", "SLEEC configuration type", IconLoader.getIcon("/resources/META-INF/pluginIcon.svg", SleecFileType.class));
        addFactory(new SleecConfigurationFactory(this));
    }
}
