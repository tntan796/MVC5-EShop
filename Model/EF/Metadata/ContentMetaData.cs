using System.ComponentModel.DataAnnotations;

namespace Model.EF.Metadata
{
    [MetadataType(typeof(ContentMetaData))]
    public partial class Content
    {
    }
    public class ContentMetaData
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public long? CategoryID { get; set; }
    }
}
