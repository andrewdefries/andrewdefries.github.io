---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.045137, 1.014098, -2.340684, 1, 0, 0, 1,
-2.46547, 0.4434462, -0.2636818, 1, 0.007843138, 0, 1,
-2.421812, -0.09757975, -0.04792393, 1, 0.01176471, 0, 1,
-2.381156, -0.4613295, -2.486768, 1, 0.01960784, 0, 1,
-2.378834, -1.172293, -2.665907, 1, 0.02352941, 0, 1,
-2.345316, 0.6049412, -1.638672, 1, 0.03137255, 0, 1,
-2.289767, 1.308933, -2.669124, 1, 0.03529412, 0, 1,
-2.224819, -1.041147, -2.305751, 1, 0.04313726, 0, 1,
-2.167297, 0.461648, -2.80365, 1, 0.04705882, 0, 1,
-2.163208, -0.3627518, -2.33, 1, 0.05490196, 0, 1,
-2.142822, 2.217332, -1.255167, 1, 0.05882353, 0, 1,
-2.131956, 0.4767315, -0.3864459, 1, 0.06666667, 0, 1,
-2.104663, 0.8968139, 0.6825882, 1, 0.07058824, 0, 1,
-2.052129, 0.1654973, -0.3131824, 1, 0.07843138, 0, 1,
-2.015041, -0.6667237, -0.8539466, 1, 0.08235294, 0, 1,
-1.98628, -2.1053, -1.111823, 1, 0.09019608, 0, 1,
-1.960922, 1.790798, -1.067759, 1, 0.09411765, 0, 1,
-1.960362, -1.189837, -3.095811, 1, 0.1019608, 0, 1,
-1.950609, 2.886736, -1.024331, 1, 0.1098039, 0, 1,
-1.950177, 2.238893, -1.179533, 1, 0.1137255, 0, 1,
-1.936971, -0.6584967, -1.454263, 1, 0.1215686, 0, 1,
-1.933865, -0.5018235, -2.202873, 1, 0.1254902, 0, 1,
-1.927897, 0.1030023, -3.414118, 1, 0.1333333, 0, 1,
-1.92271, 0.3230274, -0.7128252, 1, 0.1372549, 0, 1,
-1.922648, -0.3054273, -2.736268, 1, 0.145098, 0, 1,
-1.912193, -1.092871, -1.816766, 1, 0.1490196, 0, 1,
-1.874587, -0.9544635, -0.6530243, 1, 0.1568628, 0, 1,
-1.843557, -0.4645546, -0.5905854, 1, 0.1607843, 0, 1,
-1.793125, -0.5453067, -1.931573, 1, 0.1686275, 0, 1,
-1.768513, 2.431893, -0.7804953, 1, 0.172549, 0, 1,
-1.766066, -0.8677569, -2.894056, 1, 0.1803922, 0, 1,
-1.743686, -0.07397676, -1.473327, 1, 0.1843137, 0, 1,
-1.738897, 2.100193, 0.8201135, 1, 0.1921569, 0, 1,
-1.733721, -0.3353874, -1.544165, 1, 0.1960784, 0, 1,
-1.732131, 0.03782174, -0.8782561, 1, 0.2039216, 0, 1,
-1.728755, 0.552636, -1.401086, 1, 0.2117647, 0, 1,
-1.722135, -0.5479926, -1.800353, 1, 0.2156863, 0, 1,
-1.718349, 0.001078597, 0.5646946, 1, 0.2235294, 0, 1,
-1.70736, 1.798742, -0.1637037, 1, 0.227451, 0, 1,
-1.698773, 0.1233145, -2.014578, 1, 0.2352941, 0, 1,
-1.687923, -1.20496, -1.63489, 1, 0.2392157, 0, 1,
-1.677559, 2.068577, 0.4751153, 1, 0.2470588, 0, 1,
-1.66913, 1.058227, -0.8079637, 1, 0.2509804, 0, 1,
-1.659208, 1.802895, -0.9582088, 1, 0.2588235, 0, 1,
-1.659198, -1.372395, -2.436619, 1, 0.2627451, 0, 1,
-1.626302, -1.083739, -1.794887, 1, 0.2705882, 0, 1,
-1.624431, -0.003816553, 0.01898075, 1, 0.2745098, 0, 1,
-1.59639, 0.9689249, -1.384029, 1, 0.282353, 0, 1,
-1.584877, 0.7692963, -1.280638, 1, 0.2862745, 0, 1,
-1.575732, 2.69066, -1.536165, 1, 0.2941177, 0, 1,
-1.571458, 0.3565367, -0.1968135, 1, 0.3019608, 0, 1,
-1.565399, 0.4161818, -1.017872, 1, 0.3058824, 0, 1,
-1.560703, 0.5727119, -0.1160506, 1, 0.3137255, 0, 1,
-1.558762, 1.063821, -0.08424152, 1, 0.3176471, 0, 1,
-1.55418, -2.539284, -3.12114, 1, 0.3254902, 0, 1,
-1.539818, -0.7134882, -3.148801, 1, 0.3294118, 0, 1,
-1.539303, -0.4833714, -2.319221, 1, 0.3372549, 0, 1,
-1.535837, -0.003511933, -1.725735, 1, 0.3411765, 0, 1,
-1.529234, -0.4544041, -2.71436, 1, 0.3490196, 0, 1,
-1.522574, 0.8866805, -1.873969, 1, 0.3529412, 0, 1,
-1.518811, -0.7670199, -1.64993, 1, 0.3607843, 0, 1,
-1.511797, -0.5196283, -2.099648, 1, 0.3647059, 0, 1,
-1.511639, 0.03737553, -0.9994897, 1, 0.372549, 0, 1,
-1.499416, -0.2168879, -0.8848125, 1, 0.3764706, 0, 1,
-1.496182, -0.1978297, -1.046893, 1, 0.3843137, 0, 1,
-1.483415, -0.364382, -3.004935, 1, 0.3882353, 0, 1,
-1.4807, -1.148631, -2.602833, 1, 0.3960784, 0, 1,
-1.479808, 0.7359012, -0.937202, 1, 0.4039216, 0, 1,
-1.476539, -1.324892, -2.741594, 1, 0.4078431, 0, 1,
-1.472671, 0.923025, -0.834174, 1, 0.4156863, 0, 1,
-1.458992, 0.3935769, -2.024909, 1, 0.4196078, 0, 1,
-1.454352, -1.14294, -3.85195, 1, 0.427451, 0, 1,
-1.439456, 0.9894217, -0.8350539, 1, 0.4313726, 0, 1,
-1.428992, 2.296182, 0.7774239, 1, 0.4392157, 0, 1,
-1.414503, 0.3185661, -0.276715, 1, 0.4431373, 0, 1,
-1.414124, -0.5488971, -0.2846197, 1, 0.4509804, 0, 1,
-1.411435, 0.2930917, -1.192697, 1, 0.454902, 0, 1,
-1.398035, 0.2129255, -0.07798532, 1, 0.4627451, 0, 1,
-1.395197, -2.392729, -3.742781, 1, 0.4666667, 0, 1,
-1.395167, -0.4950984, -1.728639, 1, 0.4745098, 0, 1,
-1.383271, -0.5017822, -1.504548, 1, 0.4784314, 0, 1,
-1.376856, 0.1675026, -0.4987938, 1, 0.4862745, 0, 1,
-1.37534, -0.3753454, -2.867701, 1, 0.4901961, 0, 1,
-1.368019, 0.5511643, -1.847889, 1, 0.4980392, 0, 1,
-1.362211, 0.6649379, -3.171088, 1, 0.5058824, 0, 1,
-1.361589, -0.2868578, -0.8957196, 1, 0.509804, 0, 1,
-1.359584, 1.07694, -0.4704158, 1, 0.5176471, 0, 1,
-1.357245, -0.7574015, -1.62483, 1, 0.5215687, 0, 1,
-1.352368, -0.2684534, -1.141581, 1, 0.5294118, 0, 1,
-1.349916, 0.1819353, -2.090682, 1, 0.5333334, 0, 1,
-1.340597, -1.282092, -3.647899, 1, 0.5411765, 0, 1,
-1.338561, -0.8731611, -2.063322, 1, 0.5450981, 0, 1,
-1.319457, -0.7303858, -2.426606, 1, 0.5529412, 0, 1,
-1.312561, -1.749362, -2.685857, 1, 0.5568628, 0, 1,
-1.307597, 0.14629, -0.7552479, 1, 0.5647059, 0, 1,
-1.306286, -0.3716597, -2.063599, 1, 0.5686275, 0, 1,
-1.301051, 1.190549, -0.4427271, 1, 0.5764706, 0, 1,
-1.300267, 0.8831807, -0.07509905, 1, 0.5803922, 0, 1,
-1.282434, 0.6525266, 0.2135525, 1, 0.5882353, 0, 1,
-1.281557, 0.7561402, 0.3460971, 1, 0.5921569, 0, 1,
-1.273378, 0.9205814, -0.3767948, 1, 0.6, 0, 1,
-1.26211, 1.128657, -1.005557, 1, 0.6078432, 0, 1,
-1.253379, 0.2481884, -1.543406, 1, 0.6117647, 0, 1,
-1.248207, 0.01347868, -3.482858, 1, 0.6196079, 0, 1,
-1.247929, 0.1626907, -2.745745, 1, 0.6235294, 0, 1,
-1.242543, -0.1836306, -0.2458843, 1, 0.6313726, 0, 1,
-1.240107, 0.2011759, 0.1049522, 1, 0.6352941, 0, 1,
-1.238188, 1.54836, 0.1357733, 1, 0.6431373, 0, 1,
-1.237207, -0.4592524, -2.433116, 1, 0.6470588, 0, 1,
-1.23014, 1.625978, -0.872253, 1, 0.654902, 0, 1,
-1.214753, -0.7453313, -1.731629, 1, 0.6588235, 0, 1,
-1.214305, 0.2971096, -1.193246, 1, 0.6666667, 0, 1,
-1.210675, -1.682765, -2.257388, 1, 0.6705883, 0, 1,
-1.207848, -0.4860958, -1.803709, 1, 0.6784314, 0, 1,
-1.194275, 0.963891, -0.2502764, 1, 0.682353, 0, 1,
-1.193209, 0.7096036, -2.154236, 1, 0.6901961, 0, 1,
-1.188877, -0.254972, -2.248988, 1, 0.6941177, 0, 1,
-1.17474, 1.698521, -0.9056632, 1, 0.7019608, 0, 1,
-1.174142, 0.8006363, -0.249329, 1, 0.7098039, 0, 1,
-1.166284, -0.9621887, -1.64765, 1, 0.7137255, 0, 1,
-1.164823, 0.3406932, 0.09490181, 1, 0.7215686, 0, 1,
-1.156782, 1.478161, 0.3487568, 1, 0.7254902, 0, 1,
-1.152679, 0.2595233, -2.162807, 1, 0.7333333, 0, 1,
-1.145032, -0.3567423, -1.784646, 1, 0.7372549, 0, 1,
-1.142822, 1.709868, -0.7027503, 1, 0.7450981, 0, 1,
-1.140592, 0.8486772, -2.188589, 1, 0.7490196, 0, 1,
-1.136141, 0.3784482, -0.5167328, 1, 0.7568628, 0, 1,
-1.135138, 0.8521718, -1.577872, 1, 0.7607843, 0, 1,
-1.129207, 0.1484773, -1.549512, 1, 0.7686275, 0, 1,
-1.120023, -1.032366, -2.4951, 1, 0.772549, 0, 1,
-1.1175, -0.07930368, -2.605747, 1, 0.7803922, 0, 1,
-1.11745, 0.89243, -0.7290833, 1, 0.7843137, 0, 1,
-1.116063, -0.2928769, -1.575933, 1, 0.7921569, 0, 1,
-1.112712, 0.7763239, -0.3091088, 1, 0.7960784, 0, 1,
-1.112074, 0.3136894, 0.1942624, 1, 0.8039216, 0, 1,
-1.111367, 0.3425079, -0.1095453, 1, 0.8117647, 0, 1,
-1.109433, -0.2695554, -1.093798, 1, 0.8156863, 0, 1,
-1.107913, 0.2420907, -0.3612628, 1, 0.8235294, 0, 1,
-1.103552, -0.9271116, -2.629592, 1, 0.827451, 0, 1,
-1.100647, 0.08152162, -1.413101, 1, 0.8352941, 0, 1,
-1.100018, 0.6310915, -2.025953, 1, 0.8392157, 0, 1,
-1.094854, -0.2882422, -2.804947, 1, 0.8470588, 0, 1,
-1.094507, 0.2909213, -1.243129, 1, 0.8509804, 0, 1,
-1.085836, -1.833707, -2.36634, 1, 0.8588235, 0, 1,
-1.08363, 0.7526351, -1.094784, 1, 0.8627451, 0, 1,
-1.082302, 0.1138016, -1.054591, 1, 0.8705882, 0, 1,
-1.078011, 0.428699, -2.104255, 1, 0.8745098, 0, 1,
-1.069491, -0.1642313, -0.8563752, 1, 0.8823529, 0, 1,
-1.067931, -0.4278165, -2.221573, 1, 0.8862745, 0, 1,
-1.055278, -0.1827268, -2.243987, 1, 0.8941177, 0, 1,
-1.046593, 0.4524269, -2.28339, 1, 0.8980392, 0, 1,
-1.044142, -2.26372, -2.867136, 1, 0.9058824, 0, 1,
-1.041993, 1.261945, -0.2954254, 1, 0.9137255, 0, 1,
-1.038484, -0.6056502, -3.317403, 1, 0.9176471, 0, 1,
-1.031139, -1.369621, -3.603241, 1, 0.9254902, 0, 1,
-1.029869, 0.7781803, 0.8830844, 1, 0.9294118, 0, 1,
-1.027351, -0.2740614, -3.223849, 1, 0.9372549, 0, 1,
-1.025713, -0.04392752, -2.201629, 1, 0.9411765, 0, 1,
-1.021987, -0.8204264, -2.246173, 1, 0.9490196, 0, 1,
-1.021601, 0.2814699, -1.328249, 1, 0.9529412, 0, 1,
-1.016948, 0.1425337, -3.368858, 1, 0.9607843, 0, 1,
-1.013054, -0.2448547, -1.083346, 1, 0.9647059, 0, 1,
-1.011523, -0.1708522, -2.024016, 1, 0.972549, 0, 1,
-1.010056, 0.0950584, -2.304033, 1, 0.9764706, 0, 1,
-1.001728, 1.138934, 0.8333409, 1, 0.9843137, 0, 1,
-0.9954982, 1.168627, -2.551673, 1, 0.9882353, 0, 1,
-0.9843435, 0.3338023, -1.75134, 1, 0.9960784, 0, 1,
-0.9827907, -0.3382697, -3.394399, 0.9960784, 1, 0, 1,
-0.9760205, 1.090236, 0.8179808, 0.9921569, 1, 0, 1,
-0.9746025, -0.005614623, -1.445766, 0.9843137, 1, 0, 1,
-0.9727896, -1.945269, -2.890823, 0.9803922, 1, 0, 1,
-0.9721957, 1.136455, 1.233684, 0.972549, 1, 0, 1,
-0.9718755, 1.053457, 0.8272913, 0.9686275, 1, 0, 1,
-0.9715719, -0.5369143, -3.096171, 0.9607843, 1, 0, 1,
-0.9666925, 0.9021158, -1.688398, 0.9568627, 1, 0, 1,
-0.9600598, 0.1794887, -1.773488, 0.9490196, 1, 0, 1,
-0.9497642, -1.713649, -4.149666, 0.945098, 1, 0, 1,
-0.9490687, 0.520457, -1.822991, 0.9372549, 1, 0, 1,
-0.9407268, 0.8295093, -1.886382, 0.9333333, 1, 0, 1,
-0.9388897, -0.2587602, -2.224731, 0.9254902, 1, 0, 1,
-0.9368571, 0.3050742, -0.7839468, 0.9215686, 1, 0, 1,
-0.9310269, 2.154585, -0.09408209, 0.9137255, 1, 0, 1,
-0.9268973, 1.026311, -1.146446, 0.9098039, 1, 0, 1,
-0.9256346, 1.011945, -1.717313, 0.9019608, 1, 0, 1,
-0.9231906, -0.1811279, -1.674306, 0.8941177, 1, 0, 1,
-0.9202862, 0.09579659, -1.475142, 0.8901961, 1, 0, 1,
-0.9188128, 0.3849979, -0.3267662, 0.8823529, 1, 0, 1,
-0.9119287, -1.463014, -4.74219, 0.8784314, 1, 0, 1,
-0.9029999, 0.211594, -1.647104, 0.8705882, 1, 0, 1,
-0.8997017, -0.3692625, -1.836127, 0.8666667, 1, 0, 1,
-0.8960763, 0.08503999, -3.123016, 0.8588235, 1, 0, 1,
-0.8952838, 0.1460938, 0.03991192, 0.854902, 1, 0, 1,
-0.8872205, 0.08192509, -3.695071, 0.8470588, 1, 0, 1,
-0.8870079, 0.2398745, -1.35003, 0.8431373, 1, 0, 1,
-0.8809223, -0.001363993, -3.530425, 0.8352941, 1, 0, 1,
-0.8739345, -1.991428, -4.004035, 0.8313726, 1, 0, 1,
-0.8721074, -1.104745, -2.595725, 0.8235294, 1, 0, 1,
-0.8618418, 0.3833504, -0.9456636, 0.8196079, 1, 0, 1,
-0.8577449, 1.622596, -0.2825724, 0.8117647, 1, 0, 1,
-0.8515975, 0.8748438, -2.204165, 0.8078431, 1, 0, 1,
-0.8511286, 0.9324458, -0.7931124, 0.8, 1, 0, 1,
-0.8473531, 0.9453993, -2.092335, 0.7921569, 1, 0, 1,
-0.8468173, 0.7326716, -0.7416198, 0.7882353, 1, 0, 1,
-0.8446013, -0.6367891, -1.234777, 0.7803922, 1, 0, 1,
-0.8402557, -1.742762, -2.217029, 0.7764706, 1, 0, 1,
-0.8339582, -2.149409, -3.284709, 0.7686275, 1, 0, 1,
-0.8330761, 1.079221, -1.844639, 0.7647059, 1, 0, 1,
-0.8319954, 0.9228951, -0.8733145, 0.7568628, 1, 0, 1,
-0.8287039, -1.03863, -3.587883, 0.7529412, 1, 0, 1,
-0.8259612, -0.3298323, -4.086342, 0.7450981, 1, 0, 1,
-0.8201256, -1.04321, -3.053266, 0.7411765, 1, 0, 1,
-0.819623, -0.4524685, -1.776113, 0.7333333, 1, 0, 1,
-0.8141335, -0.516013, -1.165923, 0.7294118, 1, 0, 1,
-0.8063588, 0.6533172, -1.184479, 0.7215686, 1, 0, 1,
-0.8060359, -0.003640863, 0.1270075, 0.7176471, 1, 0, 1,
-0.7942989, 0.8443796, -1.160119, 0.7098039, 1, 0, 1,
-0.7891837, 0.03115965, -2.464835, 0.7058824, 1, 0, 1,
-0.7883769, -1.671125, -3.123269, 0.6980392, 1, 0, 1,
-0.779636, 0.1364997, -1.958083, 0.6901961, 1, 0, 1,
-0.7795936, -0.4474267, -2.571311, 0.6862745, 1, 0, 1,
-0.7764489, 0.02223431, -1.49906, 0.6784314, 1, 0, 1,
-0.7688638, -1.046791, -1.976122, 0.6745098, 1, 0, 1,
-0.7672714, -0.7041613, -3.666081, 0.6666667, 1, 0, 1,
-0.76696, 0.0236038, -1.332499, 0.6627451, 1, 0, 1,
-0.7625956, 0.01659011, -1.72425, 0.654902, 1, 0, 1,
-0.7591513, -0.6098214, -3.231678, 0.6509804, 1, 0, 1,
-0.756143, -0.9517846, -3.121622, 0.6431373, 1, 0, 1,
-0.7507759, -0.1184618, -0.4979116, 0.6392157, 1, 0, 1,
-0.7463829, 0.2600639, -3.963591, 0.6313726, 1, 0, 1,
-0.7456252, -0.9722993, -2.933926, 0.627451, 1, 0, 1,
-0.740785, 1.096417, -0.5942113, 0.6196079, 1, 0, 1,
-0.7345222, 1.475181, 0.7142832, 0.6156863, 1, 0, 1,
-0.7299418, 1.814876, -1.622077, 0.6078432, 1, 0, 1,
-0.7263199, -0.4161845, -1.595935, 0.6039216, 1, 0, 1,
-0.7197829, 1.170293, 0.8205478, 0.5960785, 1, 0, 1,
-0.717519, -0.4917869, 0.1987125, 0.5882353, 1, 0, 1,
-0.7164108, 1.530591, 0.3066954, 0.5843138, 1, 0, 1,
-0.70969, -0.1970721, -1.555691, 0.5764706, 1, 0, 1,
-0.7069023, 0.2063674, -2.668766, 0.572549, 1, 0, 1,
-0.7033228, -1.383797, -2.875114, 0.5647059, 1, 0, 1,
-0.6957164, -1.396363, -1.476756, 0.5607843, 1, 0, 1,
-0.684329, 0.3796526, -2.511077, 0.5529412, 1, 0, 1,
-0.68239, -0.7325409, -1.591004, 0.5490196, 1, 0, 1,
-0.677734, 0.9425328, -2.198352, 0.5411765, 1, 0, 1,
-0.6730202, -0.6617803, -2.103535, 0.5372549, 1, 0, 1,
-0.6709319, 0.1709897, -1.690883, 0.5294118, 1, 0, 1,
-0.6648753, -0.03697639, -2.410971, 0.5254902, 1, 0, 1,
-0.6638001, -0.4383807, -3.505593, 0.5176471, 1, 0, 1,
-0.658411, 0.2146014, -1.50435, 0.5137255, 1, 0, 1,
-0.6519668, 0.7455516, -1.156047, 0.5058824, 1, 0, 1,
-0.6518264, 0.03971431, -2.747844, 0.5019608, 1, 0, 1,
-0.6438076, 1.583838, -0.5190881, 0.4941176, 1, 0, 1,
-0.6430786, -0.5605915, -4.589875, 0.4862745, 1, 0, 1,
-0.6361358, 0.615272, -0.8149059, 0.4823529, 1, 0, 1,
-0.6348193, -0.9174637, -3.440997, 0.4745098, 1, 0, 1,
-0.6293626, 0.2406458, -1.043113, 0.4705882, 1, 0, 1,
-0.6291635, -0.8527119, -2.41184, 0.4627451, 1, 0, 1,
-0.6231398, -0.05093478, -2.337107, 0.4588235, 1, 0, 1,
-0.619962, 1.403563, -1.982209, 0.4509804, 1, 0, 1,
-0.6173469, -0.2081383, -2.14706, 0.4470588, 1, 0, 1,
-0.6141489, -1.360917, -1.836798, 0.4392157, 1, 0, 1,
-0.6138967, -0.2064705, -2.614048, 0.4352941, 1, 0, 1,
-0.6135806, -0.8763738, -1.290106, 0.427451, 1, 0, 1,
-0.6135728, -0.6372816, -2.950499, 0.4235294, 1, 0, 1,
-0.6131364, -0.849445, -4.066083, 0.4156863, 1, 0, 1,
-0.6094307, 0.03313035, -1.02005, 0.4117647, 1, 0, 1,
-0.6033101, -0.8942497, -1.56865, 0.4039216, 1, 0, 1,
-0.6031842, -1.232282, -3.595019, 0.3960784, 1, 0, 1,
-0.6022489, -0.5371287, -1.747276, 0.3921569, 1, 0, 1,
-0.5953028, 0.7910607, -1.244928, 0.3843137, 1, 0, 1,
-0.5940746, 0.7822195, -0.7958372, 0.3803922, 1, 0, 1,
-0.5914115, -0.1770116, -1.319771, 0.372549, 1, 0, 1,
-0.5900186, 1.444782, -2.674245, 0.3686275, 1, 0, 1,
-0.5883458, -0.6889705, -1.201133, 0.3607843, 1, 0, 1,
-0.5850735, -0.9517769, -1.542285, 0.3568628, 1, 0, 1,
-0.5807723, -1.155618, -3.299079, 0.3490196, 1, 0, 1,
-0.5805628, 0.3073123, -1.908531, 0.345098, 1, 0, 1,
-0.5801865, 1.240832, -1.255122, 0.3372549, 1, 0, 1,
-0.5754702, 1.406256, -0.5168491, 0.3333333, 1, 0, 1,
-0.5725482, -0.4151409, -1.232544, 0.3254902, 1, 0, 1,
-0.5695917, 0.6079314, -0.2861299, 0.3215686, 1, 0, 1,
-0.5658715, -0.6750291, -1.509101, 0.3137255, 1, 0, 1,
-0.5658041, -0.08687667, -1.136626, 0.3098039, 1, 0, 1,
-0.5652216, 1.376057, -0.9564695, 0.3019608, 1, 0, 1,
-0.5650992, 0.5142625, -0.07127891, 0.2941177, 1, 0, 1,
-0.5635598, -0.5327156, -3.630862, 0.2901961, 1, 0, 1,
-0.5606802, 0.574375, -0.5127484, 0.282353, 1, 0, 1,
-0.5597277, -0.258717, -2.583568, 0.2784314, 1, 0, 1,
-0.5561996, -1.539043, -2.589591, 0.2705882, 1, 0, 1,
-0.5515656, -1.029376, -3.834903, 0.2666667, 1, 0, 1,
-0.5508447, -0.07361759, -1.285794, 0.2588235, 1, 0, 1,
-0.5498181, -1.312558, -2.977581, 0.254902, 1, 0, 1,
-0.5497023, 2.030635, -1.097752, 0.2470588, 1, 0, 1,
-0.5472258, -0.8944822, -3.507485, 0.2431373, 1, 0, 1,
-0.5458109, 0.4355385, -0.7387622, 0.2352941, 1, 0, 1,
-0.5417004, -0.1001476, -0.61728, 0.2313726, 1, 0, 1,
-0.5392826, 1.415155, -0.9402995, 0.2235294, 1, 0, 1,
-0.5281534, -1.519809, -4.07482, 0.2196078, 1, 0, 1,
-0.5271927, 0.6591743, -1.226321, 0.2117647, 1, 0, 1,
-0.5269763, 0.5080363, -0.4523892, 0.2078431, 1, 0, 1,
-0.5256059, -1.495497, -3.018142, 0.2, 1, 0, 1,
-0.5250161, -1.311939, -2.223188, 0.1921569, 1, 0, 1,
-0.5242896, -0.3430144, -2.197236, 0.1882353, 1, 0, 1,
-0.5228115, 0.1261754, -1.441324, 0.1803922, 1, 0, 1,
-0.5213, 0.5525601, -0.7407568, 0.1764706, 1, 0, 1,
-0.5195195, 0.645005, -0.4254737, 0.1686275, 1, 0, 1,
-0.5157361, -0.2583365, -1.972964, 0.1647059, 1, 0, 1,
-0.5152954, 0.8963377, -1.222516, 0.1568628, 1, 0, 1,
-0.5138798, -0.7067134, -3.121785, 0.1529412, 1, 0, 1,
-0.5097542, -0.5291842, -2.319285, 0.145098, 1, 0, 1,
-0.5096054, -0.8237079, -1.255059, 0.1411765, 1, 0, 1,
-0.5049521, 0.2758824, -0.6820505, 0.1333333, 1, 0, 1,
-0.5026139, 0.982216, 0.2127691, 0.1294118, 1, 0, 1,
-0.5003091, 0.8664196, 0.7558383, 0.1215686, 1, 0, 1,
-0.4946197, 0.09422282, -1.055745, 0.1176471, 1, 0, 1,
-0.4894516, -0.709371, -1.548288, 0.1098039, 1, 0, 1,
-0.4887068, -2.030588, -2.313757, 0.1058824, 1, 0, 1,
-0.4870829, -0.9816781, -2.222079, 0.09803922, 1, 0, 1,
-0.4859572, -0.469901, -1.632354, 0.09019608, 1, 0, 1,
-0.4850554, -0.7753603, -2.74808, 0.08627451, 1, 0, 1,
-0.4834091, 0.9284928, -0.9777411, 0.07843138, 1, 0, 1,
-0.4830837, 0.203004, -1.303433, 0.07450981, 1, 0, 1,
-0.4825985, 0.4567876, -2.238533, 0.06666667, 1, 0, 1,
-0.4800042, 1.253486, -0.7059456, 0.0627451, 1, 0, 1,
-0.4747966, -0.7915866, -2.704801, 0.05490196, 1, 0, 1,
-0.4741617, 1.179615, -0.9781111, 0.05098039, 1, 0, 1,
-0.4694937, 1.145604, -0.595004, 0.04313726, 1, 0, 1,
-0.4646952, 1.725286, 2.702761, 0.03921569, 1, 0, 1,
-0.4634736, -0.7668449, -2.785974, 0.03137255, 1, 0, 1,
-0.4607821, 0.3164821, -0.3638889, 0.02745098, 1, 0, 1,
-0.4589413, 0.7211805, -0.1119899, 0.01960784, 1, 0, 1,
-0.4582241, -1.242556, -1.064722, 0.01568628, 1, 0, 1,
-0.4515184, -0.7983987, -2.405372, 0.007843138, 1, 0, 1,
-0.4512941, -0.1883364, -2.211877, 0.003921569, 1, 0, 1,
-0.4486824, -0.183505, -2.901223, 0, 1, 0.003921569, 1,
-0.4462821, 0.270215, 0.2080233, 0, 1, 0.01176471, 1,
-0.4450027, 1.135713, -1.912228, 0, 1, 0.01568628, 1,
-0.4397738, -1.251861, -3.764266, 0, 1, 0.02352941, 1,
-0.439437, -1.024635, -2.659206, 0, 1, 0.02745098, 1,
-0.4361107, -0.5162044, -0.6536232, 0, 1, 0.03529412, 1,
-0.435238, 0.5275416, -0.5367489, 0, 1, 0.03921569, 1,
-0.4335477, -0.2637575, -3.927085, 0, 1, 0.04705882, 1,
-0.4319806, -0.3377053, -2.413393, 0, 1, 0.05098039, 1,
-0.4310168, 1.871074, -0.8106177, 0, 1, 0.05882353, 1,
-0.4284909, 0.5550716, -0.3027631, 0, 1, 0.0627451, 1,
-0.427095, 0.03723192, -1.599722, 0, 1, 0.07058824, 1,
-0.4270653, 0.1019578, -2.459546, 0, 1, 0.07450981, 1,
-0.42665, 0.6363689, -0.8415933, 0, 1, 0.08235294, 1,
-0.4206389, -1.541117, -3.136207, 0, 1, 0.08627451, 1,
-0.4188306, 0.3123752, 0.6632849, 0, 1, 0.09411765, 1,
-0.4181949, 0.06288238, -1.689757, 0, 1, 0.1019608, 1,
-0.4171595, -0.4172002, -2.526086, 0, 1, 0.1058824, 1,
-0.4125923, -0.1365452, -2.6511, 0, 1, 0.1137255, 1,
-0.4118532, 0.4437697, 0.930239, 0, 1, 0.1176471, 1,
-0.4096805, 0.1115539, 0.04445321, 0, 1, 0.1254902, 1,
-0.4086533, 1.003971, 0.5147423, 0, 1, 0.1294118, 1,
-0.4072295, 0.7151119, 0.5902541, 0, 1, 0.1372549, 1,
-0.4071148, 0.3563567, 0.2670174, 0, 1, 0.1411765, 1,
-0.4065673, -0.5252627, -2.625207, 0, 1, 0.1490196, 1,
-0.3928061, -2.222731, -3.302329, 0, 1, 0.1529412, 1,
-0.3821763, -1.783158, -3.591192, 0, 1, 0.1607843, 1,
-0.3813452, 0.5497431, -0.06755109, 0, 1, 0.1647059, 1,
-0.3768768, -0.9337537, -2.897942, 0, 1, 0.172549, 1,
-0.3758921, -1.511736, -2.513422, 0, 1, 0.1764706, 1,
-0.3741772, 0.6599522, 0.05038853, 0, 1, 0.1843137, 1,
-0.3735582, 0.1294843, -0.8977071, 0, 1, 0.1882353, 1,
-0.3699248, -0.2268816, -1.1436, 0, 1, 0.1960784, 1,
-0.3655457, -0.5668659, -2.904363, 0, 1, 0.2039216, 1,
-0.3633687, -0.4007704, -1.790455, 0, 1, 0.2078431, 1,
-0.3631708, 0.6924062, -1.035456, 0, 1, 0.2156863, 1,
-0.36166, -0.07906653, -2.557029, 0, 1, 0.2196078, 1,
-0.3615007, 0.08412468, -2.108264, 0, 1, 0.227451, 1,
-0.3512424, 1.105859, -2.020164, 0, 1, 0.2313726, 1,
-0.3505366, 0.2585468, -1.029822, 0, 1, 0.2392157, 1,
-0.3418368, 1.231465, 1.444986, 0, 1, 0.2431373, 1,
-0.3413458, -0.8707621, -1.94165, 0, 1, 0.2509804, 1,
-0.341316, 0.261723, -1.603174, 0, 1, 0.254902, 1,
-0.3381098, 0.05370159, -0.6430188, 0, 1, 0.2627451, 1,
-0.3330861, 0.02298208, -1.296328, 0, 1, 0.2666667, 1,
-0.3326788, 0.4830177, -0.9487084, 0, 1, 0.2745098, 1,
-0.3324288, -0.6537038, -1.664043, 0, 1, 0.2784314, 1,
-0.3301758, -1.090284, -3.789284, 0, 1, 0.2862745, 1,
-0.3297423, 1.041115, -0.03848446, 0, 1, 0.2901961, 1,
-0.3279139, -0.5097614, -3.148824, 0, 1, 0.2980392, 1,
-0.3250808, -0.2873947, -1.684056, 0, 1, 0.3058824, 1,
-0.322867, -1.423599, -1.590604, 0, 1, 0.3098039, 1,
-0.3215317, 0.9457692, -0.4015756, 0, 1, 0.3176471, 1,
-0.3178498, 0.1659882, -0.4473557, 0, 1, 0.3215686, 1,
-0.3166671, -0.01235071, -0.9758281, 0, 1, 0.3294118, 1,
-0.3156962, 0.1380107, -0.5272949, 0, 1, 0.3333333, 1,
-0.3105281, 2.521528, -0.1937992, 0, 1, 0.3411765, 1,
-0.3001752, -0.5749257, -1.594369, 0, 1, 0.345098, 1,
-0.2962764, 0.5908949, 0.1738344, 0, 1, 0.3529412, 1,
-0.2949065, -0.1717633, -1.547208, 0, 1, 0.3568628, 1,
-0.2943787, -0.0620646, -2.210025, 0, 1, 0.3647059, 1,
-0.2907898, 0.174817, -0.3732814, 0, 1, 0.3686275, 1,
-0.2851027, -0.2367323, -1.590762, 0, 1, 0.3764706, 1,
-0.2810859, 1.29099, -0.3607385, 0, 1, 0.3803922, 1,
-0.2806804, -0.3966872, -4.36624, 0, 1, 0.3882353, 1,
-0.2798629, -0.8850866, -3.27482, 0, 1, 0.3921569, 1,
-0.2797785, 0.5968463, 1.557293, 0, 1, 0.4, 1,
-0.2773194, 0.9627365, 1.41807, 0, 1, 0.4078431, 1,
-0.2725056, 0.5545224, 0.4079486, 0, 1, 0.4117647, 1,
-0.2710505, 0.07937759, -1.144351, 0, 1, 0.4196078, 1,
-0.2644592, 0.9344991, -0.5210046, 0, 1, 0.4235294, 1,
-0.2590054, 1.476159, 1.710352, 0, 1, 0.4313726, 1,
-0.2519293, -0.3656008, -1.575389, 0, 1, 0.4352941, 1,
-0.2501964, 0.4519113, -1.669432, 0, 1, 0.4431373, 1,
-0.2471348, 0.07426227, 1.251957, 0, 1, 0.4470588, 1,
-0.2430693, 0.6033056, -1.545243, 0, 1, 0.454902, 1,
-0.2417196, -1.648965, -1.381562, 0, 1, 0.4588235, 1,
-0.2397037, -0.7101752, -2.540679, 0, 1, 0.4666667, 1,
-0.2326595, -1.514695, -3.12506, 0, 1, 0.4705882, 1,
-0.2322234, -0.5191916, -2.79666, 0, 1, 0.4784314, 1,
-0.2315779, -0.9558744, -2.369032, 0, 1, 0.4823529, 1,
-0.2271808, 0.2394164, 0.03120963, 0, 1, 0.4901961, 1,
-0.2264825, -0.5272008, -1.469986, 0, 1, 0.4941176, 1,
-0.2234719, 0.5640569, -0.9131954, 0, 1, 0.5019608, 1,
-0.2229432, 0.7142448, -0.9995509, 0, 1, 0.509804, 1,
-0.2210872, 0.3008688, 0.2794491, 0, 1, 0.5137255, 1,
-0.2209587, -2.340298, -2.132041, 0, 1, 0.5215687, 1,
-0.2180296, 0.4554761, -0.3839163, 0, 1, 0.5254902, 1,
-0.2168994, 0.9181489, -1.244407, 0, 1, 0.5333334, 1,
-0.2155099, -0.3328417, -3.679307, 0, 1, 0.5372549, 1,
-0.2138198, 1.08534, -0.4173894, 0, 1, 0.5450981, 1,
-0.2089945, 0.5750141, 1.458296, 0, 1, 0.5490196, 1,
-0.2074162, -0.3605492, -2.680709, 0, 1, 0.5568628, 1,
-0.2072786, -0.04077476, -1.563609, 0, 1, 0.5607843, 1,
-0.2062659, 0.7124815, -1.690662, 0, 1, 0.5686275, 1,
-0.2015219, -1.636467, -4.129909, 0, 1, 0.572549, 1,
-0.1939638, 0.004976939, -1.61681, 0, 1, 0.5803922, 1,
-0.1931409, 0.08301874, -2.71605, 0, 1, 0.5843138, 1,
-0.1922746, 1.850189, -0.1380938, 0, 1, 0.5921569, 1,
-0.1816534, -0.4119255, -1.237663, 0, 1, 0.5960785, 1,
-0.1778715, -0.6069528, -2.427339, 0, 1, 0.6039216, 1,
-0.1768656, 1.128675, -2.64911, 0, 1, 0.6117647, 1,
-0.1763912, 1.662146, -0.453909, 0, 1, 0.6156863, 1,
-0.1699422, 0.4482357, -0.3147657, 0, 1, 0.6235294, 1,
-0.1639265, -0.2654104, -1.686167, 0, 1, 0.627451, 1,
-0.1613573, 1.590796, -1.805535, 0, 1, 0.6352941, 1,
-0.1600924, -0.6417451, -2.333774, 0, 1, 0.6392157, 1,
-0.1599924, -0.2063642, 0.1889745, 0, 1, 0.6470588, 1,
-0.1599094, 1.235013, -1.978914, 0, 1, 0.6509804, 1,
-0.1597538, 0.5510213, -0.6050279, 0, 1, 0.6588235, 1,
-0.1583598, 1.188329, 0.1024934, 0, 1, 0.6627451, 1,
-0.1532933, -0.8320946, -4.619108, 0, 1, 0.6705883, 1,
-0.1530657, -1.744123, -3.79852, 0, 1, 0.6745098, 1,
-0.1526856, -0.4470951, -2.892255, 0, 1, 0.682353, 1,
-0.1500436, -0.2526444, -1.2631, 0, 1, 0.6862745, 1,
-0.149114, 1.731797, 0.2675032, 0, 1, 0.6941177, 1,
-0.1451182, -0.3312394, -2.180891, 0, 1, 0.7019608, 1,
-0.1411804, 0.2057864, 0.8656967, 0, 1, 0.7058824, 1,
-0.1411467, -0.31542, -3.234406, 0, 1, 0.7137255, 1,
-0.1411148, -0.0643116, -1.460763, 0, 1, 0.7176471, 1,
-0.136608, -2.151958, -0.9549575, 0, 1, 0.7254902, 1,
-0.1292057, -1.529424, -3.040719, 0, 1, 0.7294118, 1,
-0.128046, 1.074297, -0.3858709, 0, 1, 0.7372549, 1,
-0.1280378, 1.632255, -0.7273659, 0, 1, 0.7411765, 1,
-0.1259196, 0.07656197, -0.991686, 0, 1, 0.7490196, 1,
-0.1247732, -1.213968, -2.209298, 0, 1, 0.7529412, 1,
-0.1240389, -1.723117, -1.919325, 0, 1, 0.7607843, 1,
-0.1226553, -1.015997, -1.48407, 0, 1, 0.7647059, 1,
-0.1196608, -1.308936, -2.968457, 0, 1, 0.772549, 1,
-0.1179088, -0.4485141, -3.227755, 0, 1, 0.7764706, 1,
-0.1177234, 0.6107541, -0.9687248, 0, 1, 0.7843137, 1,
-0.1160732, 0.6197194, 1.444866, 0, 1, 0.7882353, 1,
-0.1151067, 0.2306752, 0.2930466, 0, 1, 0.7960784, 1,
-0.1041856, 0.5561415, 0.4285718, 0, 1, 0.8039216, 1,
-0.09568041, -0.2717035, -2.688987, 0, 1, 0.8078431, 1,
-0.08847616, 0.1813012, -0.2116529, 0, 1, 0.8156863, 1,
-0.08813164, -0.8320833, -3.730012, 0, 1, 0.8196079, 1,
-0.08482069, 0.599719, -0.8598296, 0, 1, 0.827451, 1,
-0.08444061, 0.4457453, 1.141441, 0, 1, 0.8313726, 1,
-0.08136265, -0.3672083, -2.151545, 0, 1, 0.8392157, 1,
-0.07424382, -0.3720258, -4.239747, 0, 1, 0.8431373, 1,
-0.07372034, 0.8685951, -0.3546953, 0, 1, 0.8509804, 1,
-0.07072789, 0.3708249, 0.02149722, 0, 1, 0.854902, 1,
-0.07008027, -1.192739, -2.83103, 0, 1, 0.8627451, 1,
-0.06804183, 0.03287617, -1.204921, 0, 1, 0.8666667, 1,
-0.06475908, 0.6914296, -0.09002674, 0, 1, 0.8745098, 1,
-0.06147402, 0.9595096, 0.6031485, 0, 1, 0.8784314, 1,
-0.05881881, 1.837955, -0.8250039, 0, 1, 0.8862745, 1,
-0.0583447, -0.2284642, -3.986126, 0, 1, 0.8901961, 1,
-0.05665157, 1.400951, 0.3343073, 0, 1, 0.8980392, 1,
-0.05646427, -0.1125843, -3.249435, 0, 1, 0.9058824, 1,
-0.04800215, -1.524617, -3.667086, 0, 1, 0.9098039, 1,
-0.04735226, 2.44392, -2.466656, 0, 1, 0.9176471, 1,
-0.0424282, -0.6755909, -1.972891, 0, 1, 0.9215686, 1,
-0.03805839, 0.08822872, 0.5993041, 0, 1, 0.9294118, 1,
-0.03790462, 2.124487, 0.6805493, 0, 1, 0.9333333, 1,
-0.03333034, 0.1495465, -0.7743023, 0, 1, 0.9411765, 1,
-0.03217652, 0.5648838, -0.07676782, 0, 1, 0.945098, 1,
-0.02680976, 0.2810646, -0.05741645, 0, 1, 0.9529412, 1,
-0.0247854, -1.604608, -3.123381, 0, 1, 0.9568627, 1,
-0.02211458, -1.906054, -4.44058, 0, 1, 0.9647059, 1,
-0.02159498, 0.0107627, -1.745733, 0, 1, 0.9686275, 1,
-0.02129024, -0.546246, -1.581961, 0, 1, 0.9764706, 1,
-0.01891766, -0.6588928, -2.485883, 0, 1, 0.9803922, 1,
-0.01496724, 1.688313, 0.4266884, 0, 1, 0.9882353, 1,
-0.01371485, -1.140345, -3.287706, 0, 1, 0.9921569, 1,
-0.01350393, 0.5953561, -1.098039, 0, 1, 1, 1,
-0.01203763, -1.001744, -4.769341, 0, 0.9921569, 1, 1,
-0.008043017, 0.5112363, -0.3174115, 0, 0.9882353, 1, 1,
-0.005684992, -0.04388405, -2.055564, 0, 0.9803922, 1, 1,
-0.00378977, 0.4788602, -0.5595506, 0, 0.9764706, 1, 1,
-0.003544369, -0.5729478, -2.299671, 0, 0.9686275, 1, 1,
-0.001293142, -0.134305, -2.748997, 0, 0.9647059, 1, 1,
-0.0001766759, 1.335719, -0.4118129, 0, 0.9568627, 1, 1,
0.002420727, 0.9508402, 1.016961, 0, 0.9529412, 1, 1,
0.0110581, -1.611804, 3.124876, 0, 0.945098, 1, 1,
0.01290798, -0.3452902, 4.323053, 0, 0.9411765, 1, 1,
0.02116657, -0.2727666, 4.082902, 0, 0.9333333, 1, 1,
0.02546967, -0.5998606, 2.446812, 0, 0.9294118, 1, 1,
0.03188452, 2.078604, 2.098349, 0, 0.9215686, 1, 1,
0.03271203, -0.4077402, 2.959042, 0, 0.9176471, 1, 1,
0.04106221, 0.274818, 0.2896768, 0, 0.9098039, 1, 1,
0.04571348, -0.3293622, 5.251415, 0, 0.9058824, 1, 1,
0.04977919, -0.06449252, 2.523982, 0, 0.8980392, 1, 1,
0.05091496, 0.4889057, 0.6164379, 0, 0.8901961, 1, 1,
0.05096957, 0.5280098, 1.587611, 0, 0.8862745, 1, 1,
0.05128025, 0.4726648, 1.257633, 0, 0.8784314, 1, 1,
0.05304267, 2.708798, -0.2300567, 0, 0.8745098, 1, 1,
0.05486204, 2.520468, 0.2182976, 0, 0.8666667, 1, 1,
0.05706429, -0.5304539, 3.895887, 0, 0.8627451, 1, 1,
0.05761631, 0.3169532, -0.7811731, 0, 0.854902, 1, 1,
0.057923, 0.7408891, 1.032711, 0, 0.8509804, 1, 1,
0.06152347, -2.094787, 2.999917, 0, 0.8431373, 1, 1,
0.06955166, -1.764458, 3.334413, 0, 0.8392157, 1, 1,
0.07152271, 0.9401019, -1.768873, 0, 0.8313726, 1, 1,
0.07325708, 0.4843375, -0.1408401, 0, 0.827451, 1, 1,
0.07393195, -1.535974, 1.763463, 0, 0.8196079, 1, 1,
0.0742604, 0.1184246, 0.9903744, 0, 0.8156863, 1, 1,
0.07449839, -0.5048802, 4.021199, 0, 0.8078431, 1, 1,
0.0796441, -1.18211, 4.297503, 0, 0.8039216, 1, 1,
0.08057975, 0.4584054, 1.01752, 0, 0.7960784, 1, 1,
0.08089802, 0.8090174, -0.3775631, 0, 0.7882353, 1, 1,
0.08348615, 0.5088779, 0.673437, 0, 0.7843137, 1, 1,
0.08511123, 0.1096969, 0.5576782, 0, 0.7764706, 1, 1,
0.08827731, -1.951302, 2.26939, 0, 0.772549, 1, 1,
0.0883805, -0.3669067, 2.909817, 0, 0.7647059, 1, 1,
0.08867107, -0.225668, 2.551514, 0, 0.7607843, 1, 1,
0.09140516, -0.9380048, 3.645468, 0, 0.7529412, 1, 1,
0.0922331, 0.6064425, 1.756107, 0, 0.7490196, 1, 1,
0.09791127, -0.8235444, 4.294033, 0, 0.7411765, 1, 1,
0.09982565, -1.081897, 3.292037, 0, 0.7372549, 1, 1,
0.1003738, 0.7288856, -0.5895343, 0, 0.7294118, 1, 1,
0.1050324, 0.04050068, 1.453247, 0, 0.7254902, 1, 1,
0.1057743, -0.6903121, 2.771449, 0, 0.7176471, 1, 1,
0.1076066, 1.140132, -0.6674178, 0, 0.7137255, 1, 1,
0.1076864, 0.6375294, 1.071524, 0, 0.7058824, 1, 1,
0.1115259, 0.543345, -0.2228098, 0, 0.6980392, 1, 1,
0.1118768, -0.4757993, 2.789808, 0, 0.6941177, 1, 1,
0.1152121, -0.2338259, 3.675074, 0, 0.6862745, 1, 1,
0.1169592, -0.1230812, 2.370673, 0, 0.682353, 1, 1,
0.1282468, 1.91883, -0.8114804, 0, 0.6745098, 1, 1,
0.1301285, 1.177091, -1.608334, 0, 0.6705883, 1, 1,
0.1424281, -1.131102, 1.739857, 0, 0.6627451, 1, 1,
0.1436312, 0.8631603, 0.3970785, 0, 0.6588235, 1, 1,
0.1455234, 1.10748, 0.152963, 0, 0.6509804, 1, 1,
0.1474598, -0.4564662, 3.148797, 0, 0.6470588, 1, 1,
0.1577942, 0.4342152, 1.713372, 0, 0.6392157, 1, 1,
0.1583925, 0.3641409, -1.742728, 0, 0.6352941, 1, 1,
0.1598499, 1.552677, -1.277057, 0, 0.627451, 1, 1,
0.1600767, -0.3552587, 3.362195, 0, 0.6235294, 1, 1,
0.1602813, -0.06128417, -0.03281845, 0, 0.6156863, 1, 1,
0.1628827, -0.9515958, 2.049974, 0, 0.6117647, 1, 1,
0.1632247, 0.4872622, -0.7335825, 0, 0.6039216, 1, 1,
0.1638813, -1.099908, 3.786839, 0, 0.5960785, 1, 1,
0.1653132, 0.4496436, 0.1305008, 0, 0.5921569, 1, 1,
0.1676331, 1.23229, -1.529993, 0, 0.5843138, 1, 1,
0.1694062, 0.6704565, 0.4211359, 0, 0.5803922, 1, 1,
0.1733794, -0.9330511, 4.26976, 0, 0.572549, 1, 1,
0.1739931, -0.05993864, -0.02470439, 0, 0.5686275, 1, 1,
0.1749357, -0.05324611, 0.4002262, 0, 0.5607843, 1, 1,
0.1762505, 1.406523, 0.82782, 0, 0.5568628, 1, 1,
0.1829311, 0.02237264, -0.05774747, 0, 0.5490196, 1, 1,
0.1832353, 0.5587162, 0.1240698, 0, 0.5450981, 1, 1,
0.1854987, -0.8288801, 3.140103, 0, 0.5372549, 1, 1,
0.1863865, 0.9862623, -0.5867144, 0, 0.5333334, 1, 1,
0.1870566, 0.3446054, 0.4596168, 0, 0.5254902, 1, 1,
0.1894081, 0.6869479, -0.5086101, 0, 0.5215687, 1, 1,
0.1912837, 0.7103326, -1.144268, 0, 0.5137255, 1, 1,
0.1916621, 0.6409272, -0.3249466, 0, 0.509804, 1, 1,
0.1918817, 1.678225, -0.03774368, 0, 0.5019608, 1, 1,
0.1974795, -1.474371, 2.986471, 0, 0.4941176, 1, 1,
0.2013907, -0.6191978, 2.86039, 0, 0.4901961, 1, 1,
0.2027389, -1.728447, -0.2151987, 0, 0.4823529, 1, 1,
0.2030461, 0.7582951, -0.2701364, 0, 0.4784314, 1, 1,
0.2049374, 0.4169274, 1.24412, 0, 0.4705882, 1, 1,
0.205365, 1.749514, 0.4312456, 0, 0.4666667, 1, 1,
0.2101499, -0.06393387, 1.344839, 0, 0.4588235, 1, 1,
0.2120074, 0.353353, 0.2064181, 0, 0.454902, 1, 1,
0.2132666, -0.5650533, 2.660039, 0, 0.4470588, 1, 1,
0.2159467, 0.2494284, -0.5877482, 0, 0.4431373, 1, 1,
0.2175947, 0.4819457, 1.533523, 0, 0.4352941, 1, 1,
0.2211813, -1.67252, 3.491241, 0, 0.4313726, 1, 1,
0.2279055, 0.3301362, -0.4552553, 0, 0.4235294, 1, 1,
0.2344252, 1.973498, 0.7408946, 0, 0.4196078, 1, 1,
0.2370046, -1.606914, 1.698163, 0, 0.4117647, 1, 1,
0.2385357, -1.509709, 2.802958, 0, 0.4078431, 1, 1,
0.2395453, -1.074238, 1.62108, 0, 0.4, 1, 1,
0.2471705, -2.455221, 3.628313, 0, 0.3921569, 1, 1,
0.2474202, -0.0341825, 1.674086, 0, 0.3882353, 1, 1,
0.2580084, 1.059107, 0.6201419, 0, 0.3803922, 1, 1,
0.2582847, -1.336134, 3.198087, 0, 0.3764706, 1, 1,
0.2632427, 1.718056, -0.4569839, 0, 0.3686275, 1, 1,
0.2643839, 0.3209719, 1.960324, 0, 0.3647059, 1, 1,
0.2663421, 0.2466883, 1.438366, 0, 0.3568628, 1, 1,
0.2744234, 1.009577, 0.5456793, 0, 0.3529412, 1, 1,
0.2772342, 2.059029, 1.037492, 0, 0.345098, 1, 1,
0.2782434, 0.8536149, 0.8855886, 0, 0.3411765, 1, 1,
0.284748, 0.4000974, 0.3923995, 0, 0.3333333, 1, 1,
0.2916283, 0.5882285, 2.295902, 0, 0.3294118, 1, 1,
0.2933974, 0.7810723, 0.5591211, 0, 0.3215686, 1, 1,
0.2942748, -0.3426475, 2.482075, 0, 0.3176471, 1, 1,
0.2946226, -0.934675, 2.288518, 0, 0.3098039, 1, 1,
0.3026911, -1.176492, 3.164328, 0, 0.3058824, 1, 1,
0.3027689, -1.312945, 2.341574, 0, 0.2980392, 1, 1,
0.3060874, 0.3804172, 1.976731, 0, 0.2901961, 1, 1,
0.3075947, 0.4615861, 1.760417, 0, 0.2862745, 1, 1,
0.308098, -1.238058, 3.225349, 0, 0.2784314, 1, 1,
0.3130553, -0.1375757, 2.37149, 0, 0.2745098, 1, 1,
0.315314, -1.684103, 5.228718, 0, 0.2666667, 1, 1,
0.3158226, -0.2219168, 2.059607, 0, 0.2627451, 1, 1,
0.3159656, 1.002024, -1.172487, 0, 0.254902, 1, 1,
0.3187356, 0.1675835, 0.9766769, 0, 0.2509804, 1, 1,
0.3188196, -0.7504762, 2.611724, 0, 0.2431373, 1, 1,
0.3214227, -1.164278, 2.565248, 0, 0.2392157, 1, 1,
0.3269423, 0.8306442, -1.313538, 0, 0.2313726, 1, 1,
0.3276894, 0.5225692, 0.9876524, 0, 0.227451, 1, 1,
0.3285036, -0.1804058, 1.825983, 0, 0.2196078, 1, 1,
0.3286422, -0.550585, 2.167182, 0, 0.2156863, 1, 1,
0.3286543, -1.046648, 3.677108, 0, 0.2078431, 1, 1,
0.3299083, 1.348422, 0.1041316, 0, 0.2039216, 1, 1,
0.3304479, 1.734608, 1.718656, 0, 0.1960784, 1, 1,
0.3305772, -0.1402129, 1.872854, 0, 0.1882353, 1, 1,
0.3314644, 0.7958124, -1.628094, 0, 0.1843137, 1, 1,
0.3322615, -1.550962, 2.605358, 0, 0.1764706, 1, 1,
0.3324334, -0.5005792, 2.527031, 0, 0.172549, 1, 1,
0.3329432, -1.529899, 3.243633, 0, 0.1647059, 1, 1,
0.3350509, 0.5355642, 1.597205, 0, 0.1607843, 1, 1,
0.3351215, -0.3550733, 2.206116, 0, 0.1529412, 1, 1,
0.3355532, 0.7081566, 1.569958, 0, 0.1490196, 1, 1,
0.3380187, 0.876684, 0.3108415, 0, 0.1411765, 1, 1,
0.3384991, 0.9405764, 0.4745187, 0, 0.1372549, 1, 1,
0.3388752, -1.189162, 2.433088, 0, 0.1294118, 1, 1,
0.344327, 1.040646, 0.4985388, 0, 0.1254902, 1, 1,
0.3446867, -0.5510116, 2.475567, 0, 0.1176471, 1, 1,
0.3508792, 1.520358, -0.2396446, 0, 0.1137255, 1, 1,
0.3519845, -1.845147, 2.803706, 0, 0.1058824, 1, 1,
0.353808, 0.4855667, 1.363617, 0, 0.09803922, 1, 1,
0.3569157, -0.4048202, 2.731066, 0, 0.09411765, 1, 1,
0.3594906, 0.04030469, 2.23986, 0, 0.08627451, 1, 1,
0.3625538, -0.4079873, 1.941445, 0, 0.08235294, 1, 1,
0.3630283, 0.01163615, 1.562319, 0, 0.07450981, 1, 1,
0.3641725, -0.2879957, 1.819296, 0, 0.07058824, 1, 1,
0.3650385, -1.056881, 3.334588, 0, 0.0627451, 1, 1,
0.3653083, -2.617352, 3.007082, 0, 0.05882353, 1, 1,
0.3699929, -1.161574, 3.495926, 0, 0.05098039, 1, 1,
0.3713044, -2.352887, 2.735719, 0, 0.04705882, 1, 1,
0.3713408, 0.6721426, 1.317566, 0, 0.03921569, 1, 1,
0.3736325, -0.3771801, 1.983572, 0, 0.03529412, 1, 1,
0.3757392, 0.6241149, 2.37521, 0, 0.02745098, 1, 1,
0.3775356, 0.4525942, 2.15265, 0, 0.02352941, 1, 1,
0.3792943, -0.673791, 2.688978, 0, 0.01568628, 1, 1,
0.3840405, 1.578694, 0.9847117, 0, 0.01176471, 1, 1,
0.3880494, -1.410163, 2.474383, 0, 0.003921569, 1, 1,
0.3911861, 1.471515, 0.6877593, 0.003921569, 0, 1, 1,
0.3914644, -0.1561149, 1.877699, 0.007843138, 0, 1, 1,
0.3920586, 0.3672216, 0.7605587, 0.01568628, 0, 1, 1,
0.3961737, 0.9920084, 0.9580019, 0.01960784, 0, 1, 1,
0.3966725, -1.761039, 3.200857, 0.02745098, 0, 1, 1,
0.3991565, -0.7783151, 2.650577, 0.03137255, 0, 1, 1,
0.4001302, -0.5207832, 1.718689, 0.03921569, 0, 1, 1,
0.4002514, -0.828212, 4.915824, 0.04313726, 0, 1, 1,
0.4070563, -0.1126853, 0.09198278, 0.05098039, 0, 1, 1,
0.409439, -0.6207611, 1.949914, 0.05490196, 0, 1, 1,
0.410153, 1.111812, 1.719274, 0.0627451, 0, 1, 1,
0.4110928, -0.3292291, 1.776866, 0.06666667, 0, 1, 1,
0.416658, -0.4646085, 3.144102, 0.07450981, 0, 1, 1,
0.426255, -0.8283824, 2.354924, 0.07843138, 0, 1, 1,
0.4266505, -0.2597302, 0.1232604, 0.08627451, 0, 1, 1,
0.4269645, -0.272198, 1.07649, 0.09019608, 0, 1, 1,
0.4272941, -1.845863, 4.61365, 0.09803922, 0, 1, 1,
0.4302081, -1.60347, 4.602278, 0.1058824, 0, 1, 1,
0.4329079, -0.8143377, 2.594033, 0.1098039, 0, 1, 1,
0.4353641, -1.905947, 2.693046, 0.1176471, 0, 1, 1,
0.4384363, -0.6522241, 3.253201, 0.1215686, 0, 1, 1,
0.4385005, -1.19203, 2.224406, 0.1294118, 0, 1, 1,
0.4467928, 0.07128074, 1.100879, 0.1333333, 0, 1, 1,
0.4486762, 1.810685, 0.4417299, 0.1411765, 0, 1, 1,
0.4486951, -0.8108701, 2.943774, 0.145098, 0, 1, 1,
0.4505871, 0.0136637, 2.927373, 0.1529412, 0, 1, 1,
0.4525944, 0.4047508, 1.386946, 0.1568628, 0, 1, 1,
0.4531003, -1.541362, 2.145088, 0.1647059, 0, 1, 1,
0.4621476, 1.344847, 1.171259, 0.1686275, 0, 1, 1,
0.4670841, -0.2340794, 2.071468, 0.1764706, 0, 1, 1,
0.4675752, -0.1421043, 2.471894, 0.1803922, 0, 1, 1,
0.46874, -0.2603103, 0.7430354, 0.1882353, 0, 1, 1,
0.4757262, 0.7398232, -0.6702083, 0.1921569, 0, 1, 1,
0.477724, -0.7619854, 2.803121, 0.2, 0, 1, 1,
0.4818575, -0.6607205, 2.241369, 0.2078431, 0, 1, 1,
0.4830147, -0.7167006, 0.9199924, 0.2117647, 0, 1, 1,
0.485675, 0.2392694, 0.9049972, 0.2196078, 0, 1, 1,
0.4893764, 0.1420432, 0.4051847, 0.2235294, 0, 1, 1,
0.4904357, -0.4697806, 1.759989, 0.2313726, 0, 1, 1,
0.4972118, 0.5860308, 1.576779, 0.2352941, 0, 1, 1,
0.5013198, 0.9583783, -0.6092793, 0.2431373, 0, 1, 1,
0.5065711, 1.005804, 2.536613, 0.2470588, 0, 1, 1,
0.5160372, -0.4311315, 0.9696828, 0.254902, 0, 1, 1,
0.5250559, -0.3037919, 3.749498, 0.2588235, 0, 1, 1,
0.5262958, 0.1328388, 0.9163622, 0.2666667, 0, 1, 1,
0.5274206, -0.2646818, 2.376502, 0.2705882, 0, 1, 1,
0.5284032, 1.201386, 1.754393, 0.2784314, 0, 1, 1,
0.5288428, -0.5451835, 3.063477, 0.282353, 0, 1, 1,
0.5323183, -0.04008759, 1.134697, 0.2901961, 0, 1, 1,
0.537029, -0.8495842, 2.390115, 0.2941177, 0, 1, 1,
0.5391393, 0.1202056, 2.854446, 0.3019608, 0, 1, 1,
0.5461586, -0.3837784, -1.162932, 0.3098039, 0, 1, 1,
0.5524226, -0.257897, 0.5010867, 0.3137255, 0, 1, 1,
0.5527506, -0.7047724, 2.474782, 0.3215686, 0, 1, 1,
0.5532456, 1.892692, -0.01132727, 0.3254902, 0, 1, 1,
0.5536975, -0.7967508, 2.391922, 0.3333333, 0, 1, 1,
0.5585734, 0.05174764, 3.082788, 0.3372549, 0, 1, 1,
0.5651659, -1.810687, 1.029602, 0.345098, 0, 1, 1,
0.5659932, -0.9302725, 0.6887622, 0.3490196, 0, 1, 1,
0.5668514, 0.433769, -1.129937, 0.3568628, 0, 1, 1,
0.5679005, 0.9182802, -0.2024097, 0.3607843, 0, 1, 1,
0.5765048, -0.5111587, 2.372472, 0.3686275, 0, 1, 1,
0.5793747, -0.3852697, 2.252071, 0.372549, 0, 1, 1,
0.5813431, -0.5130302, 2.63852, 0.3803922, 0, 1, 1,
0.5840684, 0.287663, 0.7743297, 0.3843137, 0, 1, 1,
0.5855169, 0.1653576, 0.4463511, 0.3921569, 0, 1, 1,
0.5870645, -0.2733947, 3.771815, 0.3960784, 0, 1, 1,
0.592884, -0.4297609, 1.860311, 0.4039216, 0, 1, 1,
0.592996, 1.053658, -0.1336186, 0.4117647, 0, 1, 1,
0.6016436, -1.099471, 2.852264, 0.4156863, 0, 1, 1,
0.6020173, -0.6850142, 2.441669, 0.4235294, 0, 1, 1,
0.6082788, -0.3088332, 0.7780885, 0.427451, 0, 1, 1,
0.6169694, 0.9947879, 2.761748, 0.4352941, 0, 1, 1,
0.617398, 0.5280475, 1.4362, 0.4392157, 0, 1, 1,
0.62022, -0.4228552, 0.6698677, 0.4470588, 0, 1, 1,
0.6298738, 2.196465, 0.07283031, 0.4509804, 0, 1, 1,
0.6333084, -2.398022, 1.415576, 0.4588235, 0, 1, 1,
0.6339695, 0.2026087, -0.2002809, 0.4627451, 0, 1, 1,
0.6342887, 1.1853, -0.03459346, 0.4705882, 0, 1, 1,
0.6358124, 0.1542265, 0.6536355, 0.4745098, 0, 1, 1,
0.6415772, 0.4139636, -0.1667431, 0.4823529, 0, 1, 1,
0.6417562, 0.6069167, 1.293722, 0.4862745, 0, 1, 1,
0.6423755, -1.411706, 2.987382, 0.4941176, 0, 1, 1,
0.6555393, 0.2892708, 2.001375, 0.5019608, 0, 1, 1,
0.6556355, -0.1996714, 0.9932907, 0.5058824, 0, 1, 1,
0.6577347, 0.2526781, 2.94645, 0.5137255, 0, 1, 1,
0.6604511, -0.2819903, 2.271704, 0.5176471, 0, 1, 1,
0.6605649, 0.4407237, 0.5943186, 0.5254902, 0, 1, 1,
0.6608372, -0.853147, 2.256574, 0.5294118, 0, 1, 1,
0.6642617, 1.469588, 1.991377, 0.5372549, 0, 1, 1,
0.6722, 0.8911672, -0.6384991, 0.5411765, 0, 1, 1,
0.6733153, 0.6668552, -2.4524, 0.5490196, 0, 1, 1,
0.6745427, -1.107651, 1.738375, 0.5529412, 0, 1, 1,
0.6750197, 0.2023861, 2.383043, 0.5607843, 0, 1, 1,
0.6753961, 0.63658, 2.034367, 0.5647059, 0, 1, 1,
0.6754563, -1.168435, 2.782406, 0.572549, 0, 1, 1,
0.6782258, 0.210878, -0.6352719, 0.5764706, 0, 1, 1,
0.6813228, -0.2261593, 1.503475, 0.5843138, 0, 1, 1,
0.6899085, 1.303602, 1.78196, 0.5882353, 0, 1, 1,
0.6902425, 1.447462, 1.570138, 0.5960785, 0, 1, 1,
0.692272, -0.8749548, 2.791229, 0.6039216, 0, 1, 1,
0.694172, 0.1147715, 1.743974, 0.6078432, 0, 1, 1,
0.7041809, 0.8375447, 1.292298, 0.6156863, 0, 1, 1,
0.704623, -1.078167, 0.8908777, 0.6196079, 0, 1, 1,
0.7060162, 0.4422933, 2.009491, 0.627451, 0, 1, 1,
0.7145057, 0.5070739, -0.4797918, 0.6313726, 0, 1, 1,
0.719018, -1.127577, 1.90203, 0.6392157, 0, 1, 1,
0.7204965, -0.3775561, 2.282366, 0.6431373, 0, 1, 1,
0.7222192, -1.002919, 1.276834, 0.6509804, 0, 1, 1,
0.7258298, -0.3200715, 2.743348, 0.654902, 0, 1, 1,
0.7343287, 0.664658, 1.427026, 0.6627451, 0, 1, 1,
0.7350219, 0.2949396, 1.5523, 0.6666667, 0, 1, 1,
0.7384781, 1.87868, 1.169951, 0.6745098, 0, 1, 1,
0.7427233, 0.5082514, 1.604224, 0.6784314, 0, 1, 1,
0.7464207, -0.9084784, 2.084606, 0.6862745, 0, 1, 1,
0.7536595, -0.2123018, 2.137444, 0.6901961, 0, 1, 1,
0.7543015, -0.2506801, 2.993159, 0.6980392, 0, 1, 1,
0.7577766, 1.715703, 0.03824821, 0.7058824, 0, 1, 1,
0.7603308, -0.5647827, 2.300516, 0.7098039, 0, 1, 1,
0.7611083, -0.5743424, 1.815959, 0.7176471, 0, 1, 1,
0.7618233, -1.763085, 3.813501, 0.7215686, 0, 1, 1,
0.7630849, 0.3649017, 0.824658, 0.7294118, 0, 1, 1,
0.7691961, -1.063818, 3.670074, 0.7333333, 0, 1, 1,
0.7692727, -0.08524901, 1.861006, 0.7411765, 0, 1, 1,
0.7717932, -0.2315206, 1.157124, 0.7450981, 0, 1, 1,
0.7746579, 1.331478, 1.75136, 0.7529412, 0, 1, 1,
0.7756827, 0.4883529, 1.24827, 0.7568628, 0, 1, 1,
0.7793753, -0.1353758, 1.753063, 0.7647059, 0, 1, 1,
0.782895, -0.5922925, 4.968225, 0.7686275, 0, 1, 1,
0.7926875, 0.8958104, -1.045087, 0.7764706, 0, 1, 1,
0.7979955, -0.5571394, 1.891958, 0.7803922, 0, 1, 1,
0.8005955, -0.4898667, 2.46925, 0.7882353, 0, 1, 1,
0.8060144, 0.537083, -0.04945754, 0.7921569, 0, 1, 1,
0.8062482, -2.184733, 2.946158, 0.8, 0, 1, 1,
0.8091002, 0.9545809, 0.703832, 0.8078431, 0, 1, 1,
0.8103384, 1.282797, 1.144823, 0.8117647, 0, 1, 1,
0.8148314, 0.07184371, 0.3745431, 0.8196079, 0, 1, 1,
0.8190197, -0.7443742, 1.895892, 0.8235294, 0, 1, 1,
0.8218842, 2.960544, 0.112885, 0.8313726, 0, 1, 1,
0.8249148, -0.01135019, 2.246698, 0.8352941, 0, 1, 1,
0.8254383, -0.09449986, 2.479238, 0.8431373, 0, 1, 1,
0.8258958, 1.232507, 0.5042487, 0.8470588, 0, 1, 1,
0.827635, 0.4346476, 2.087831, 0.854902, 0, 1, 1,
0.838232, 0.3775351, 1.207596, 0.8588235, 0, 1, 1,
0.8459226, 0.323196, 2.946391, 0.8666667, 0, 1, 1,
0.8508798, 2.999656, -0.4279923, 0.8705882, 0, 1, 1,
0.851054, 2.295934, 0.5524777, 0.8784314, 0, 1, 1,
0.8511372, -0.800245, 2.264869, 0.8823529, 0, 1, 1,
0.8522878, -2.078375, 2.477537, 0.8901961, 0, 1, 1,
0.8558021, 0.299523, 0.6432108, 0.8941177, 0, 1, 1,
0.8572782, -0.7901704, 3.535013, 0.9019608, 0, 1, 1,
0.8577304, -0.2245363, 3.376728, 0.9098039, 0, 1, 1,
0.861635, 2.287412, -1.457852, 0.9137255, 0, 1, 1,
0.8626934, 0.8048851, 0.4580801, 0.9215686, 0, 1, 1,
0.8634896, -0.0808077, 3.183112, 0.9254902, 0, 1, 1,
0.8638686, 0.6199367, 1.098422, 0.9333333, 0, 1, 1,
0.8692839, -0.2333796, 1.406761, 0.9372549, 0, 1, 1,
0.8716266, -1.010018, 2.773124, 0.945098, 0, 1, 1,
0.8759779, 0.2035293, 1.404548, 0.9490196, 0, 1, 1,
0.8798047, 0.4868605, 2.307615, 0.9568627, 0, 1, 1,
0.884841, 0.6971102, 0.05376063, 0.9607843, 0, 1, 1,
0.8850545, 1.439906, -0.5907302, 0.9686275, 0, 1, 1,
0.8870823, 0.5149881, 1.706108, 0.972549, 0, 1, 1,
0.8878829, 0.09483813, 2.693747, 0.9803922, 0, 1, 1,
0.8902191, -1.657095, 3.243483, 0.9843137, 0, 1, 1,
0.8921221, 0.8252267, 0.8837609, 0.9921569, 0, 1, 1,
0.8959344, -0.1447716, 2.908899, 0.9960784, 0, 1, 1,
0.9009198, 1.338408, 2.934388, 1, 0, 0.9960784, 1,
0.9014539, -1.428095, 2.690146, 1, 0, 0.9882353, 1,
0.9059402, 2.236621, 2.035409, 1, 0, 0.9843137, 1,
0.9076787, -1.138058, 1.401371, 1, 0, 0.9764706, 1,
0.9087344, -0.07119397, 0.6491243, 1, 0, 0.972549, 1,
0.912317, -0.3797053, 2.880193, 1, 0, 0.9647059, 1,
0.9143125, -0.3382328, 2.276669, 1, 0, 0.9607843, 1,
0.9213177, -0.1416147, 0.9657071, 1, 0, 0.9529412, 1,
0.9240542, -0.2410705, 1.335827, 1, 0, 0.9490196, 1,
0.9317819, -0.4922774, 2.426579, 1, 0, 0.9411765, 1,
0.9324738, 0.9216334, -0.8551483, 1, 0, 0.9372549, 1,
0.9340951, -0.77826, 1.585644, 1, 0, 0.9294118, 1,
0.9377801, 1.123405, 0.5218255, 1, 0, 0.9254902, 1,
0.9486743, 0.9093739, 1.164602, 1, 0, 0.9176471, 1,
0.9502957, 0.383377, 0.6085789, 1, 0, 0.9137255, 1,
0.9681993, -1.404074, 1.077368, 1, 0, 0.9058824, 1,
0.9822598, -1.5218, 3.862841, 1, 0, 0.9019608, 1,
0.9887517, 0.5167953, 3.847751, 1, 0, 0.8941177, 1,
0.9918224, -0.08005749, 1.59838, 1, 0, 0.8862745, 1,
0.9956628, -0.02963924, -0.09656724, 1, 0, 0.8823529, 1,
0.9964676, -1.920429, 4.080758, 1, 0, 0.8745098, 1,
0.9971744, 0.5819456, 0.1680234, 1, 0, 0.8705882, 1,
1.016487, -0.6451755, 2.025738, 1, 0, 0.8627451, 1,
1.021727, -0.08435953, 2.879476, 1, 0, 0.8588235, 1,
1.024803, 1.83654, 1.029913, 1, 0, 0.8509804, 1,
1.027905, 0.1474575, 1.363818, 1, 0, 0.8470588, 1,
1.030779, 1.019496, 0.001275671, 1, 0, 0.8392157, 1,
1.031388, -0.4274023, 1.788102, 1, 0, 0.8352941, 1,
1.046422, 0.7483542, 0.2920621, 1, 0, 0.827451, 1,
1.048619, -1.223062, 3.371034, 1, 0, 0.8235294, 1,
1.055184, -0.3504863, 0.218964, 1, 0, 0.8156863, 1,
1.05536, 0.2322717, 0.9724212, 1, 0, 0.8117647, 1,
1.061197, 1.136079, -1.119096, 1, 0, 0.8039216, 1,
1.062057, -0.6327157, 1.963187, 1, 0, 0.7960784, 1,
1.067832, 0.5419298, -0.3715637, 1, 0, 0.7921569, 1,
1.069477, 0.1698062, 1.966795, 1, 0, 0.7843137, 1,
1.075186, 1.418952, 0.9342294, 1, 0, 0.7803922, 1,
1.075482, -1.051651, 2.672909, 1, 0, 0.772549, 1,
1.07911, -0.5855115, 1.773439, 1, 0, 0.7686275, 1,
1.082097, -0.8212861, 1.936041, 1, 0, 0.7607843, 1,
1.091091, 1.198868, -0.681865, 1, 0, 0.7568628, 1,
1.095486, -0.1319552, 3.793315, 1, 0, 0.7490196, 1,
1.111349, -1.737148, 1.882537, 1, 0, 0.7450981, 1,
1.11526, -1.023022, 2.04336, 1, 0, 0.7372549, 1,
1.137319, -1.560108, 3.956087, 1, 0, 0.7333333, 1,
1.137367, -1.031777, 2.268032, 1, 0, 0.7254902, 1,
1.143176, -0.5424829, 2.587075, 1, 0, 0.7215686, 1,
1.144436, 1.72822, -0.5902624, 1, 0, 0.7137255, 1,
1.150887, -0.126152, 1.399136, 1, 0, 0.7098039, 1,
1.155744, -0.1007634, 2.7663, 1, 0, 0.7019608, 1,
1.158228, 2.422404, 0.03803729, 1, 0, 0.6941177, 1,
1.171095, 0.005394275, 1.109354, 1, 0, 0.6901961, 1,
1.172112, -0.7136784, 2.868273, 1, 0, 0.682353, 1,
1.173128, 1.831585, 0.2340306, 1, 0, 0.6784314, 1,
1.190384, -2.308675, 1.893157, 1, 0, 0.6705883, 1,
1.201369, 0.9484189, 2.233271, 1, 0, 0.6666667, 1,
1.202867, -1.667235, 2.049482, 1, 0, 0.6588235, 1,
1.204215, 0.5676074, 1.566007, 1, 0, 0.654902, 1,
1.208579, 1.565456, 0.09105432, 1, 0, 0.6470588, 1,
1.209194, -2.124911, 3.663217, 1, 0, 0.6431373, 1,
1.211272, 0.02213401, 1.26994, 1, 0, 0.6352941, 1,
1.221911, 0.2594535, 1.311058, 1, 0, 0.6313726, 1,
1.229792, 0.6877522, 2.268239, 1, 0, 0.6235294, 1,
1.231831, -0.5572551, 0.03719811, 1, 0, 0.6196079, 1,
1.24629, -0.3164617, 2.047843, 1, 0, 0.6117647, 1,
1.253292, -0.3991736, 1.038204, 1, 0, 0.6078432, 1,
1.2603, -0.9505914, 2.019522, 1, 0, 0.6, 1,
1.263828, -0.438382, 2.867096, 1, 0, 0.5921569, 1,
1.284112, 0.660454, 1.09906, 1, 0, 0.5882353, 1,
1.298335, -1.30716, 3.246803, 1, 0, 0.5803922, 1,
1.30006, -0.8472834, 0.9228944, 1, 0, 0.5764706, 1,
1.305523, -0.5158595, -0.6763306, 1, 0, 0.5686275, 1,
1.306194, -0.1040568, 2.197368, 1, 0, 0.5647059, 1,
1.311642, -0.2366791, 0.3211074, 1, 0, 0.5568628, 1,
1.312738, -0.3672482, 0.839011, 1, 0, 0.5529412, 1,
1.322234, -0.1855233, 3.837643, 1, 0, 0.5450981, 1,
1.325625, -0.213478, 2.747042, 1, 0, 0.5411765, 1,
1.334522, -0.4282496, 3.595139, 1, 0, 0.5333334, 1,
1.335712, -0.09105564, 2.945342, 1, 0, 0.5294118, 1,
1.338861, -0.2653985, 1.736156, 1, 0, 0.5215687, 1,
1.352389, 1.590999, 0.7234757, 1, 0, 0.5176471, 1,
1.352482, -0.7725862, 2.056387, 1, 0, 0.509804, 1,
1.359572, 1.964422, 0.3212066, 1, 0, 0.5058824, 1,
1.368799, 0.3923924, 1.374637, 1, 0, 0.4980392, 1,
1.37328, 0.4877641, 1.182309, 1, 0, 0.4901961, 1,
1.380408, -1.283174, 0.9512516, 1, 0, 0.4862745, 1,
1.387277, -1.547529, 4.41941, 1, 0, 0.4784314, 1,
1.395215, -0.3294962, 1.605207, 1, 0, 0.4745098, 1,
1.39615, 1.410086, 0.03413656, 1, 0, 0.4666667, 1,
1.404194, -0.2266288, 2.330348, 1, 0, 0.4627451, 1,
1.407461, -1.072672, 2.559301, 1, 0, 0.454902, 1,
1.434072, 0.004804245, 0.7802739, 1, 0, 0.4509804, 1,
1.434709, 1.766546, 1.475977, 1, 0, 0.4431373, 1,
1.439182, -0.6733128, 2.669249, 1, 0, 0.4392157, 1,
1.440789, 0.7192565, 0.988583, 1, 0, 0.4313726, 1,
1.442051, 2.625383, 0.6491067, 1, 0, 0.427451, 1,
1.449793, 0.9266765, 1.867459, 1, 0, 0.4196078, 1,
1.454889, -0.7968426, 3.720357, 1, 0, 0.4156863, 1,
1.45524, -0.0326439, 3.075505, 1, 0, 0.4078431, 1,
1.462271, 0.7147648, 1.693006, 1, 0, 0.4039216, 1,
1.469436, -0.694767, 1.982712, 1, 0, 0.3960784, 1,
1.475803, -0.5472242, 1.896356, 1, 0, 0.3882353, 1,
1.476183, 0.2259204, 1.378253, 1, 0, 0.3843137, 1,
1.480952, -1.354444, 2.324116, 1, 0, 0.3764706, 1,
1.493809, -0.7996886, 1.120511, 1, 0, 0.372549, 1,
1.502233, -0.5857962, 1.742886, 1, 0, 0.3647059, 1,
1.505482, 0.1836653, 0.2104661, 1, 0, 0.3607843, 1,
1.509234, -1.365192, 1.481287, 1, 0, 0.3529412, 1,
1.509392, 2.031086, -0.1884484, 1, 0, 0.3490196, 1,
1.514942, 0.6017998, 2.646004, 1, 0, 0.3411765, 1,
1.519176, -1.051249, 3.351928, 1, 0, 0.3372549, 1,
1.525885, -0.5172911, 3.676293, 1, 0, 0.3294118, 1,
1.541, -0.5720008, 1.32005, 1, 0, 0.3254902, 1,
1.545129, -0.5282745, 0.5695637, 1, 0, 0.3176471, 1,
1.547795, 0.3013698, 1.367678, 1, 0, 0.3137255, 1,
1.554901, -0.3128373, 1.451887, 1, 0, 0.3058824, 1,
1.56226, 1.980283, 0.3087989, 1, 0, 0.2980392, 1,
1.568475, -1.814722, 2.093343, 1, 0, 0.2941177, 1,
1.602939, 0.7457972, 1.391109, 1, 0, 0.2862745, 1,
1.616824, -0.818391, 2.556538, 1, 0, 0.282353, 1,
1.634407, 0.2007477, 2.356727, 1, 0, 0.2745098, 1,
1.639574, -0.3326973, 2.737644, 1, 0, 0.2705882, 1,
1.661804, -0.185319, 2.564677, 1, 0, 0.2627451, 1,
1.669372, 0.7730831, 1.178123, 1, 0, 0.2588235, 1,
1.671923, -0.5055552, 2.729251, 1, 0, 0.2509804, 1,
1.675308, 1.378044, 2.238375, 1, 0, 0.2470588, 1,
1.678789, 1.558924, 2.536784, 1, 0, 0.2392157, 1,
1.680117, -0.4780555, 2.908548, 1, 0, 0.2352941, 1,
1.683321, -0.6621087, 3.84791, 1, 0, 0.227451, 1,
1.691517, -1.478644, 3.527659, 1, 0, 0.2235294, 1,
1.727638, 0.8775725, 0.5629446, 1, 0, 0.2156863, 1,
1.731596, -0.1867285, 1.929787, 1, 0, 0.2117647, 1,
1.744491, -1.385649, 2.834477, 1, 0, 0.2039216, 1,
1.755586, -0.7767805, 0.9527066, 1, 0, 0.1960784, 1,
1.787254, -0.1128423, 1.167976, 1, 0, 0.1921569, 1,
1.79565, 1.385496, -0.5122684, 1, 0, 0.1843137, 1,
1.799041, -0.1397763, 2.12028, 1, 0, 0.1803922, 1,
1.828834, 0.4165399, 0.8997542, 1, 0, 0.172549, 1,
1.840261, -1.313014, 2.173337, 1, 0, 0.1686275, 1,
1.863858, -1.25444, 2.037796, 1, 0, 0.1607843, 1,
1.865569, -0.8461642, 3.178775, 1, 0, 0.1568628, 1,
1.891541, -0.5144261, 2.975893, 1, 0, 0.1490196, 1,
1.89448, 0.3708686, 1.119258, 1, 0, 0.145098, 1,
1.917167, -1.123353, 1.955309, 1, 0, 0.1372549, 1,
1.971103, 0.1863534, 1.722888, 1, 0, 0.1333333, 1,
2.000914, 1.255707, 1.338938, 1, 0, 0.1254902, 1,
2.087988, 0.5857843, 1.953796, 1, 0, 0.1215686, 1,
2.098016, -0.1357225, 2.504876, 1, 0, 0.1137255, 1,
2.175182, -1.15569, 0.1484817, 1, 0, 0.1098039, 1,
2.20692, 0.3878482, 2.05286, 1, 0, 0.1019608, 1,
2.269157, -0.3753725, 2.048525, 1, 0, 0.09411765, 1,
2.307615, -0.09902278, 0.8865813, 1, 0, 0.09019608, 1,
2.325588, -1.532566, 2.605808, 1, 0, 0.08235294, 1,
2.373592, -0.1204606, 2.756218, 1, 0, 0.07843138, 1,
2.399751, 0.8569373, 0.9075954, 1, 0, 0.07058824, 1,
2.412337, 0.7295749, 2.791102, 1, 0, 0.06666667, 1,
2.412802, 0.7220104, 2.728069, 1, 0, 0.05882353, 1,
2.452774, 0.6405705, 0.1420252, 1, 0, 0.05490196, 1,
2.512458, -0.8304305, 1.053298, 1, 0, 0.04705882, 1,
2.527554, 0.8766682, -0.3823035, 1, 0, 0.04313726, 1,
2.586879, 1.078312, 1.086255, 1, 0, 0.03529412, 1,
2.688912, -0.5493731, 1.644935, 1, 0, 0.03137255, 1,
2.830601, 1.247669, -0.724501, 1, 0, 0.02352941, 1,
3.017994, 1.751864, -0.3126843, 1, 0, 0.01960784, 1,
3.27461, 0.1316583, 1.263669, 1, 0, 0.01176471, 1,
3.637706, -0.5228236, 1.72576, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.2962846, -3.569435, -6.46786, 0, -0.5, 0.5, 0.5,
0.2962846, -3.569435, -6.46786, 1, -0.5, 0.5, 0.5,
0.2962846, -3.569435, -6.46786, 1, 1.5, 0.5, 0.5,
0.2962846, -3.569435, -6.46786, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.177878, 0.1911522, -6.46786, 0, -0.5, 0.5, 0.5,
-4.177878, 0.1911522, -6.46786, 1, -0.5, 0.5, 0.5,
-4.177878, 0.1911522, -6.46786, 1, 1.5, 0.5, 0.5,
-4.177878, 0.1911522, -6.46786, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.177878, -3.569435, 0.2410369, 0, -0.5, 0.5, 0.5,
-4.177878, -3.569435, 0.2410369, 1, -0.5, 0.5, 0.5,
-4.177878, -3.569435, 0.2410369, 1, 1.5, 0.5, 0.5,
-4.177878, -3.569435, 0.2410369, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -2.701607, -4.919653,
3, -2.701607, -4.919653,
-3, -2.701607, -4.919653,
-3, -2.846245, -5.177687,
-2, -2.701607, -4.919653,
-2, -2.846245, -5.177687,
-1, -2.701607, -4.919653,
-1, -2.846245, -5.177687,
0, -2.701607, -4.919653,
0, -2.846245, -5.177687,
1, -2.701607, -4.919653,
1, -2.846245, -5.177687,
2, -2.701607, -4.919653,
2, -2.846245, -5.177687,
3, -2.701607, -4.919653,
3, -2.846245, -5.177687
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
-3, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
-3, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
-3, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
-2, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
-2, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
-2, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
-2, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
-1, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
-1, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
-1, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
-1, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
0, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
0, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
0, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
0, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
1, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
1, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
1, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
1, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
2, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
2, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
2, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
2, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5,
3, -3.135521, -5.693756, 0, -0.5, 0.5, 0.5,
3, -3.135521, -5.693756, 1, -0.5, 0.5, 0.5,
3, -3.135521, -5.693756, 1, 1.5, 0.5, 0.5,
3, -3.135521, -5.693756, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.145379, -2, -4.919653,
-3.145379, 2, -4.919653,
-3.145379, -2, -4.919653,
-3.317462, -2, -5.177687,
-3.145379, -1, -4.919653,
-3.317462, -1, -5.177687,
-3.145379, 0, -4.919653,
-3.317462, 0, -5.177687,
-3.145379, 1, -4.919653,
-3.317462, 1, -5.177687,
-3.145379, 2, -4.919653,
-3.317462, 2, -5.177687
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.661629, -2, -5.693756, 0, -0.5, 0.5, 0.5,
-3.661629, -2, -5.693756, 1, -0.5, 0.5, 0.5,
-3.661629, -2, -5.693756, 1, 1.5, 0.5, 0.5,
-3.661629, -2, -5.693756, 0, 1.5, 0.5, 0.5,
-3.661629, -1, -5.693756, 0, -0.5, 0.5, 0.5,
-3.661629, -1, -5.693756, 1, -0.5, 0.5, 0.5,
-3.661629, -1, -5.693756, 1, 1.5, 0.5, 0.5,
-3.661629, -1, -5.693756, 0, 1.5, 0.5, 0.5,
-3.661629, 0, -5.693756, 0, -0.5, 0.5, 0.5,
-3.661629, 0, -5.693756, 1, -0.5, 0.5, 0.5,
-3.661629, 0, -5.693756, 1, 1.5, 0.5, 0.5,
-3.661629, 0, -5.693756, 0, 1.5, 0.5, 0.5,
-3.661629, 1, -5.693756, 0, -0.5, 0.5, 0.5,
-3.661629, 1, -5.693756, 1, -0.5, 0.5, 0.5,
-3.661629, 1, -5.693756, 1, 1.5, 0.5, 0.5,
-3.661629, 1, -5.693756, 0, 1.5, 0.5, 0.5,
-3.661629, 2, -5.693756, 0, -0.5, 0.5, 0.5,
-3.661629, 2, -5.693756, 1, -0.5, 0.5, 0.5,
-3.661629, 2, -5.693756, 1, 1.5, 0.5, 0.5,
-3.661629, 2, -5.693756, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.145379, -2.701607, -4,
-3.145379, -2.701607, 4,
-3.145379, -2.701607, -4,
-3.317462, -2.846245, -4,
-3.145379, -2.701607, -2,
-3.317462, -2.846245, -2,
-3.145379, -2.701607, 0,
-3.317462, -2.846245, 0,
-3.145379, -2.701607, 2,
-3.317462, -2.846245, 2,
-3.145379, -2.701607, 4,
-3.317462, -2.846245, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.661629, -3.135521, -4, 0, -0.5, 0.5, 0.5,
-3.661629, -3.135521, -4, 1, -0.5, 0.5, 0.5,
-3.661629, -3.135521, -4, 1, 1.5, 0.5, 0.5,
-3.661629, -3.135521, -4, 0, 1.5, 0.5, 0.5,
-3.661629, -3.135521, -2, 0, -0.5, 0.5, 0.5,
-3.661629, -3.135521, -2, 1, -0.5, 0.5, 0.5,
-3.661629, -3.135521, -2, 1, 1.5, 0.5, 0.5,
-3.661629, -3.135521, -2, 0, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 0, 0, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 0, 1, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 0, 1, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 0, 0, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 2, 0, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 2, 1, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 2, 1, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 2, 0, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 4, 0, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 4, 1, -0.5, 0.5, 0.5,
-3.661629, -3.135521, 4, 1, 1.5, 0.5, 0.5,
-3.661629, -3.135521, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.145379, -2.701607, -4.919653,
-3.145379, 3.083912, -4.919653,
-3.145379, -2.701607, 5.401727,
-3.145379, 3.083912, 5.401727,
-3.145379, -2.701607, -4.919653,
-3.145379, -2.701607, 5.401727,
-3.145379, 3.083912, -4.919653,
-3.145379, 3.083912, 5.401727,
-3.145379, -2.701607, -4.919653,
3.737948, -2.701607, -4.919653,
-3.145379, -2.701607, 5.401727,
3.737948, -2.701607, 5.401727,
-3.145379, 3.083912, -4.919653,
3.737948, 3.083912, -4.919653,
-3.145379, 3.083912, 5.401727,
3.737948, 3.083912, 5.401727,
3.737948, -2.701607, -4.919653,
3.737948, 3.083912, -4.919653,
3.737948, -2.701607, 5.401727,
3.737948, 3.083912, 5.401727,
3.737948, -2.701607, -4.919653,
3.737948, -2.701607, 5.401727,
3.737948, 3.083912, -4.919653,
3.737948, 3.083912, 5.401727
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.309554;
var distance = 32.52103;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2962846, -0.1911522, -0.2410369 );
mvMatrix.scale( 1.14817, 1.366037, 0.7657148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.52103);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methyl_formate<-read.table("Methyl_formate.xyz")
```

```
## Error in read.table("Methyl_formate.xyz"): no lines available in input
```

```r
x<-Methyl_formate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
```

```r
y<-Methyl_formate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
```

```r
z<-Methyl_formate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.045137, 1.014098, -2.340684, 0, 0, 1, 1, 1,
-2.46547, 0.4434462, -0.2636818, 1, 0, 0, 1, 1,
-2.421812, -0.09757975, -0.04792393, 1, 0, 0, 1, 1,
-2.381156, -0.4613295, -2.486768, 1, 0, 0, 1, 1,
-2.378834, -1.172293, -2.665907, 1, 0, 0, 1, 1,
-2.345316, 0.6049412, -1.638672, 1, 0, 0, 1, 1,
-2.289767, 1.308933, -2.669124, 0, 0, 0, 1, 1,
-2.224819, -1.041147, -2.305751, 0, 0, 0, 1, 1,
-2.167297, 0.461648, -2.80365, 0, 0, 0, 1, 1,
-2.163208, -0.3627518, -2.33, 0, 0, 0, 1, 1,
-2.142822, 2.217332, -1.255167, 0, 0, 0, 1, 1,
-2.131956, 0.4767315, -0.3864459, 0, 0, 0, 1, 1,
-2.104663, 0.8968139, 0.6825882, 0, 0, 0, 1, 1,
-2.052129, 0.1654973, -0.3131824, 1, 1, 1, 1, 1,
-2.015041, -0.6667237, -0.8539466, 1, 1, 1, 1, 1,
-1.98628, -2.1053, -1.111823, 1, 1, 1, 1, 1,
-1.960922, 1.790798, -1.067759, 1, 1, 1, 1, 1,
-1.960362, -1.189837, -3.095811, 1, 1, 1, 1, 1,
-1.950609, 2.886736, -1.024331, 1, 1, 1, 1, 1,
-1.950177, 2.238893, -1.179533, 1, 1, 1, 1, 1,
-1.936971, -0.6584967, -1.454263, 1, 1, 1, 1, 1,
-1.933865, -0.5018235, -2.202873, 1, 1, 1, 1, 1,
-1.927897, 0.1030023, -3.414118, 1, 1, 1, 1, 1,
-1.92271, 0.3230274, -0.7128252, 1, 1, 1, 1, 1,
-1.922648, -0.3054273, -2.736268, 1, 1, 1, 1, 1,
-1.912193, -1.092871, -1.816766, 1, 1, 1, 1, 1,
-1.874587, -0.9544635, -0.6530243, 1, 1, 1, 1, 1,
-1.843557, -0.4645546, -0.5905854, 1, 1, 1, 1, 1,
-1.793125, -0.5453067, -1.931573, 0, 0, 1, 1, 1,
-1.768513, 2.431893, -0.7804953, 1, 0, 0, 1, 1,
-1.766066, -0.8677569, -2.894056, 1, 0, 0, 1, 1,
-1.743686, -0.07397676, -1.473327, 1, 0, 0, 1, 1,
-1.738897, 2.100193, 0.8201135, 1, 0, 0, 1, 1,
-1.733721, -0.3353874, -1.544165, 1, 0, 0, 1, 1,
-1.732131, 0.03782174, -0.8782561, 0, 0, 0, 1, 1,
-1.728755, 0.552636, -1.401086, 0, 0, 0, 1, 1,
-1.722135, -0.5479926, -1.800353, 0, 0, 0, 1, 1,
-1.718349, 0.001078597, 0.5646946, 0, 0, 0, 1, 1,
-1.70736, 1.798742, -0.1637037, 0, 0, 0, 1, 1,
-1.698773, 0.1233145, -2.014578, 0, 0, 0, 1, 1,
-1.687923, -1.20496, -1.63489, 0, 0, 0, 1, 1,
-1.677559, 2.068577, 0.4751153, 1, 1, 1, 1, 1,
-1.66913, 1.058227, -0.8079637, 1, 1, 1, 1, 1,
-1.659208, 1.802895, -0.9582088, 1, 1, 1, 1, 1,
-1.659198, -1.372395, -2.436619, 1, 1, 1, 1, 1,
-1.626302, -1.083739, -1.794887, 1, 1, 1, 1, 1,
-1.624431, -0.003816553, 0.01898075, 1, 1, 1, 1, 1,
-1.59639, 0.9689249, -1.384029, 1, 1, 1, 1, 1,
-1.584877, 0.7692963, -1.280638, 1, 1, 1, 1, 1,
-1.575732, 2.69066, -1.536165, 1, 1, 1, 1, 1,
-1.571458, 0.3565367, -0.1968135, 1, 1, 1, 1, 1,
-1.565399, 0.4161818, -1.017872, 1, 1, 1, 1, 1,
-1.560703, 0.5727119, -0.1160506, 1, 1, 1, 1, 1,
-1.558762, 1.063821, -0.08424152, 1, 1, 1, 1, 1,
-1.55418, -2.539284, -3.12114, 1, 1, 1, 1, 1,
-1.539818, -0.7134882, -3.148801, 1, 1, 1, 1, 1,
-1.539303, -0.4833714, -2.319221, 0, 0, 1, 1, 1,
-1.535837, -0.003511933, -1.725735, 1, 0, 0, 1, 1,
-1.529234, -0.4544041, -2.71436, 1, 0, 0, 1, 1,
-1.522574, 0.8866805, -1.873969, 1, 0, 0, 1, 1,
-1.518811, -0.7670199, -1.64993, 1, 0, 0, 1, 1,
-1.511797, -0.5196283, -2.099648, 1, 0, 0, 1, 1,
-1.511639, 0.03737553, -0.9994897, 0, 0, 0, 1, 1,
-1.499416, -0.2168879, -0.8848125, 0, 0, 0, 1, 1,
-1.496182, -0.1978297, -1.046893, 0, 0, 0, 1, 1,
-1.483415, -0.364382, -3.004935, 0, 0, 0, 1, 1,
-1.4807, -1.148631, -2.602833, 0, 0, 0, 1, 1,
-1.479808, 0.7359012, -0.937202, 0, 0, 0, 1, 1,
-1.476539, -1.324892, -2.741594, 0, 0, 0, 1, 1,
-1.472671, 0.923025, -0.834174, 1, 1, 1, 1, 1,
-1.458992, 0.3935769, -2.024909, 1, 1, 1, 1, 1,
-1.454352, -1.14294, -3.85195, 1, 1, 1, 1, 1,
-1.439456, 0.9894217, -0.8350539, 1, 1, 1, 1, 1,
-1.428992, 2.296182, 0.7774239, 1, 1, 1, 1, 1,
-1.414503, 0.3185661, -0.276715, 1, 1, 1, 1, 1,
-1.414124, -0.5488971, -0.2846197, 1, 1, 1, 1, 1,
-1.411435, 0.2930917, -1.192697, 1, 1, 1, 1, 1,
-1.398035, 0.2129255, -0.07798532, 1, 1, 1, 1, 1,
-1.395197, -2.392729, -3.742781, 1, 1, 1, 1, 1,
-1.395167, -0.4950984, -1.728639, 1, 1, 1, 1, 1,
-1.383271, -0.5017822, -1.504548, 1, 1, 1, 1, 1,
-1.376856, 0.1675026, -0.4987938, 1, 1, 1, 1, 1,
-1.37534, -0.3753454, -2.867701, 1, 1, 1, 1, 1,
-1.368019, 0.5511643, -1.847889, 1, 1, 1, 1, 1,
-1.362211, 0.6649379, -3.171088, 0, 0, 1, 1, 1,
-1.361589, -0.2868578, -0.8957196, 1, 0, 0, 1, 1,
-1.359584, 1.07694, -0.4704158, 1, 0, 0, 1, 1,
-1.357245, -0.7574015, -1.62483, 1, 0, 0, 1, 1,
-1.352368, -0.2684534, -1.141581, 1, 0, 0, 1, 1,
-1.349916, 0.1819353, -2.090682, 1, 0, 0, 1, 1,
-1.340597, -1.282092, -3.647899, 0, 0, 0, 1, 1,
-1.338561, -0.8731611, -2.063322, 0, 0, 0, 1, 1,
-1.319457, -0.7303858, -2.426606, 0, 0, 0, 1, 1,
-1.312561, -1.749362, -2.685857, 0, 0, 0, 1, 1,
-1.307597, 0.14629, -0.7552479, 0, 0, 0, 1, 1,
-1.306286, -0.3716597, -2.063599, 0, 0, 0, 1, 1,
-1.301051, 1.190549, -0.4427271, 0, 0, 0, 1, 1,
-1.300267, 0.8831807, -0.07509905, 1, 1, 1, 1, 1,
-1.282434, 0.6525266, 0.2135525, 1, 1, 1, 1, 1,
-1.281557, 0.7561402, 0.3460971, 1, 1, 1, 1, 1,
-1.273378, 0.9205814, -0.3767948, 1, 1, 1, 1, 1,
-1.26211, 1.128657, -1.005557, 1, 1, 1, 1, 1,
-1.253379, 0.2481884, -1.543406, 1, 1, 1, 1, 1,
-1.248207, 0.01347868, -3.482858, 1, 1, 1, 1, 1,
-1.247929, 0.1626907, -2.745745, 1, 1, 1, 1, 1,
-1.242543, -0.1836306, -0.2458843, 1, 1, 1, 1, 1,
-1.240107, 0.2011759, 0.1049522, 1, 1, 1, 1, 1,
-1.238188, 1.54836, 0.1357733, 1, 1, 1, 1, 1,
-1.237207, -0.4592524, -2.433116, 1, 1, 1, 1, 1,
-1.23014, 1.625978, -0.872253, 1, 1, 1, 1, 1,
-1.214753, -0.7453313, -1.731629, 1, 1, 1, 1, 1,
-1.214305, 0.2971096, -1.193246, 1, 1, 1, 1, 1,
-1.210675, -1.682765, -2.257388, 0, 0, 1, 1, 1,
-1.207848, -0.4860958, -1.803709, 1, 0, 0, 1, 1,
-1.194275, 0.963891, -0.2502764, 1, 0, 0, 1, 1,
-1.193209, 0.7096036, -2.154236, 1, 0, 0, 1, 1,
-1.188877, -0.254972, -2.248988, 1, 0, 0, 1, 1,
-1.17474, 1.698521, -0.9056632, 1, 0, 0, 1, 1,
-1.174142, 0.8006363, -0.249329, 0, 0, 0, 1, 1,
-1.166284, -0.9621887, -1.64765, 0, 0, 0, 1, 1,
-1.164823, 0.3406932, 0.09490181, 0, 0, 0, 1, 1,
-1.156782, 1.478161, 0.3487568, 0, 0, 0, 1, 1,
-1.152679, 0.2595233, -2.162807, 0, 0, 0, 1, 1,
-1.145032, -0.3567423, -1.784646, 0, 0, 0, 1, 1,
-1.142822, 1.709868, -0.7027503, 0, 0, 0, 1, 1,
-1.140592, 0.8486772, -2.188589, 1, 1, 1, 1, 1,
-1.136141, 0.3784482, -0.5167328, 1, 1, 1, 1, 1,
-1.135138, 0.8521718, -1.577872, 1, 1, 1, 1, 1,
-1.129207, 0.1484773, -1.549512, 1, 1, 1, 1, 1,
-1.120023, -1.032366, -2.4951, 1, 1, 1, 1, 1,
-1.1175, -0.07930368, -2.605747, 1, 1, 1, 1, 1,
-1.11745, 0.89243, -0.7290833, 1, 1, 1, 1, 1,
-1.116063, -0.2928769, -1.575933, 1, 1, 1, 1, 1,
-1.112712, 0.7763239, -0.3091088, 1, 1, 1, 1, 1,
-1.112074, 0.3136894, 0.1942624, 1, 1, 1, 1, 1,
-1.111367, 0.3425079, -0.1095453, 1, 1, 1, 1, 1,
-1.109433, -0.2695554, -1.093798, 1, 1, 1, 1, 1,
-1.107913, 0.2420907, -0.3612628, 1, 1, 1, 1, 1,
-1.103552, -0.9271116, -2.629592, 1, 1, 1, 1, 1,
-1.100647, 0.08152162, -1.413101, 1, 1, 1, 1, 1,
-1.100018, 0.6310915, -2.025953, 0, 0, 1, 1, 1,
-1.094854, -0.2882422, -2.804947, 1, 0, 0, 1, 1,
-1.094507, 0.2909213, -1.243129, 1, 0, 0, 1, 1,
-1.085836, -1.833707, -2.36634, 1, 0, 0, 1, 1,
-1.08363, 0.7526351, -1.094784, 1, 0, 0, 1, 1,
-1.082302, 0.1138016, -1.054591, 1, 0, 0, 1, 1,
-1.078011, 0.428699, -2.104255, 0, 0, 0, 1, 1,
-1.069491, -0.1642313, -0.8563752, 0, 0, 0, 1, 1,
-1.067931, -0.4278165, -2.221573, 0, 0, 0, 1, 1,
-1.055278, -0.1827268, -2.243987, 0, 0, 0, 1, 1,
-1.046593, 0.4524269, -2.28339, 0, 0, 0, 1, 1,
-1.044142, -2.26372, -2.867136, 0, 0, 0, 1, 1,
-1.041993, 1.261945, -0.2954254, 0, 0, 0, 1, 1,
-1.038484, -0.6056502, -3.317403, 1, 1, 1, 1, 1,
-1.031139, -1.369621, -3.603241, 1, 1, 1, 1, 1,
-1.029869, 0.7781803, 0.8830844, 1, 1, 1, 1, 1,
-1.027351, -0.2740614, -3.223849, 1, 1, 1, 1, 1,
-1.025713, -0.04392752, -2.201629, 1, 1, 1, 1, 1,
-1.021987, -0.8204264, -2.246173, 1, 1, 1, 1, 1,
-1.021601, 0.2814699, -1.328249, 1, 1, 1, 1, 1,
-1.016948, 0.1425337, -3.368858, 1, 1, 1, 1, 1,
-1.013054, -0.2448547, -1.083346, 1, 1, 1, 1, 1,
-1.011523, -0.1708522, -2.024016, 1, 1, 1, 1, 1,
-1.010056, 0.0950584, -2.304033, 1, 1, 1, 1, 1,
-1.001728, 1.138934, 0.8333409, 1, 1, 1, 1, 1,
-0.9954982, 1.168627, -2.551673, 1, 1, 1, 1, 1,
-0.9843435, 0.3338023, -1.75134, 1, 1, 1, 1, 1,
-0.9827907, -0.3382697, -3.394399, 1, 1, 1, 1, 1,
-0.9760205, 1.090236, 0.8179808, 0, 0, 1, 1, 1,
-0.9746025, -0.005614623, -1.445766, 1, 0, 0, 1, 1,
-0.9727896, -1.945269, -2.890823, 1, 0, 0, 1, 1,
-0.9721957, 1.136455, 1.233684, 1, 0, 0, 1, 1,
-0.9718755, 1.053457, 0.8272913, 1, 0, 0, 1, 1,
-0.9715719, -0.5369143, -3.096171, 1, 0, 0, 1, 1,
-0.9666925, 0.9021158, -1.688398, 0, 0, 0, 1, 1,
-0.9600598, 0.1794887, -1.773488, 0, 0, 0, 1, 1,
-0.9497642, -1.713649, -4.149666, 0, 0, 0, 1, 1,
-0.9490687, 0.520457, -1.822991, 0, 0, 0, 1, 1,
-0.9407268, 0.8295093, -1.886382, 0, 0, 0, 1, 1,
-0.9388897, -0.2587602, -2.224731, 0, 0, 0, 1, 1,
-0.9368571, 0.3050742, -0.7839468, 0, 0, 0, 1, 1,
-0.9310269, 2.154585, -0.09408209, 1, 1, 1, 1, 1,
-0.9268973, 1.026311, -1.146446, 1, 1, 1, 1, 1,
-0.9256346, 1.011945, -1.717313, 1, 1, 1, 1, 1,
-0.9231906, -0.1811279, -1.674306, 1, 1, 1, 1, 1,
-0.9202862, 0.09579659, -1.475142, 1, 1, 1, 1, 1,
-0.9188128, 0.3849979, -0.3267662, 1, 1, 1, 1, 1,
-0.9119287, -1.463014, -4.74219, 1, 1, 1, 1, 1,
-0.9029999, 0.211594, -1.647104, 1, 1, 1, 1, 1,
-0.8997017, -0.3692625, -1.836127, 1, 1, 1, 1, 1,
-0.8960763, 0.08503999, -3.123016, 1, 1, 1, 1, 1,
-0.8952838, 0.1460938, 0.03991192, 1, 1, 1, 1, 1,
-0.8872205, 0.08192509, -3.695071, 1, 1, 1, 1, 1,
-0.8870079, 0.2398745, -1.35003, 1, 1, 1, 1, 1,
-0.8809223, -0.001363993, -3.530425, 1, 1, 1, 1, 1,
-0.8739345, -1.991428, -4.004035, 1, 1, 1, 1, 1,
-0.8721074, -1.104745, -2.595725, 0, 0, 1, 1, 1,
-0.8618418, 0.3833504, -0.9456636, 1, 0, 0, 1, 1,
-0.8577449, 1.622596, -0.2825724, 1, 0, 0, 1, 1,
-0.8515975, 0.8748438, -2.204165, 1, 0, 0, 1, 1,
-0.8511286, 0.9324458, -0.7931124, 1, 0, 0, 1, 1,
-0.8473531, 0.9453993, -2.092335, 1, 0, 0, 1, 1,
-0.8468173, 0.7326716, -0.7416198, 0, 0, 0, 1, 1,
-0.8446013, -0.6367891, -1.234777, 0, 0, 0, 1, 1,
-0.8402557, -1.742762, -2.217029, 0, 0, 0, 1, 1,
-0.8339582, -2.149409, -3.284709, 0, 0, 0, 1, 1,
-0.8330761, 1.079221, -1.844639, 0, 0, 0, 1, 1,
-0.8319954, 0.9228951, -0.8733145, 0, 0, 0, 1, 1,
-0.8287039, -1.03863, -3.587883, 0, 0, 0, 1, 1,
-0.8259612, -0.3298323, -4.086342, 1, 1, 1, 1, 1,
-0.8201256, -1.04321, -3.053266, 1, 1, 1, 1, 1,
-0.819623, -0.4524685, -1.776113, 1, 1, 1, 1, 1,
-0.8141335, -0.516013, -1.165923, 1, 1, 1, 1, 1,
-0.8063588, 0.6533172, -1.184479, 1, 1, 1, 1, 1,
-0.8060359, -0.003640863, 0.1270075, 1, 1, 1, 1, 1,
-0.7942989, 0.8443796, -1.160119, 1, 1, 1, 1, 1,
-0.7891837, 0.03115965, -2.464835, 1, 1, 1, 1, 1,
-0.7883769, -1.671125, -3.123269, 1, 1, 1, 1, 1,
-0.779636, 0.1364997, -1.958083, 1, 1, 1, 1, 1,
-0.7795936, -0.4474267, -2.571311, 1, 1, 1, 1, 1,
-0.7764489, 0.02223431, -1.49906, 1, 1, 1, 1, 1,
-0.7688638, -1.046791, -1.976122, 1, 1, 1, 1, 1,
-0.7672714, -0.7041613, -3.666081, 1, 1, 1, 1, 1,
-0.76696, 0.0236038, -1.332499, 1, 1, 1, 1, 1,
-0.7625956, 0.01659011, -1.72425, 0, 0, 1, 1, 1,
-0.7591513, -0.6098214, -3.231678, 1, 0, 0, 1, 1,
-0.756143, -0.9517846, -3.121622, 1, 0, 0, 1, 1,
-0.7507759, -0.1184618, -0.4979116, 1, 0, 0, 1, 1,
-0.7463829, 0.2600639, -3.963591, 1, 0, 0, 1, 1,
-0.7456252, -0.9722993, -2.933926, 1, 0, 0, 1, 1,
-0.740785, 1.096417, -0.5942113, 0, 0, 0, 1, 1,
-0.7345222, 1.475181, 0.7142832, 0, 0, 0, 1, 1,
-0.7299418, 1.814876, -1.622077, 0, 0, 0, 1, 1,
-0.7263199, -0.4161845, -1.595935, 0, 0, 0, 1, 1,
-0.7197829, 1.170293, 0.8205478, 0, 0, 0, 1, 1,
-0.717519, -0.4917869, 0.1987125, 0, 0, 0, 1, 1,
-0.7164108, 1.530591, 0.3066954, 0, 0, 0, 1, 1,
-0.70969, -0.1970721, -1.555691, 1, 1, 1, 1, 1,
-0.7069023, 0.2063674, -2.668766, 1, 1, 1, 1, 1,
-0.7033228, -1.383797, -2.875114, 1, 1, 1, 1, 1,
-0.6957164, -1.396363, -1.476756, 1, 1, 1, 1, 1,
-0.684329, 0.3796526, -2.511077, 1, 1, 1, 1, 1,
-0.68239, -0.7325409, -1.591004, 1, 1, 1, 1, 1,
-0.677734, 0.9425328, -2.198352, 1, 1, 1, 1, 1,
-0.6730202, -0.6617803, -2.103535, 1, 1, 1, 1, 1,
-0.6709319, 0.1709897, -1.690883, 1, 1, 1, 1, 1,
-0.6648753, -0.03697639, -2.410971, 1, 1, 1, 1, 1,
-0.6638001, -0.4383807, -3.505593, 1, 1, 1, 1, 1,
-0.658411, 0.2146014, -1.50435, 1, 1, 1, 1, 1,
-0.6519668, 0.7455516, -1.156047, 1, 1, 1, 1, 1,
-0.6518264, 0.03971431, -2.747844, 1, 1, 1, 1, 1,
-0.6438076, 1.583838, -0.5190881, 1, 1, 1, 1, 1,
-0.6430786, -0.5605915, -4.589875, 0, 0, 1, 1, 1,
-0.6361358, 0.615272, -0.8149059, 1, 0, 0, 1, 1,
-0.6348193, -0.9174637, -3.440997, 1, 0, 0, 1, 1,
-0.6293626, 0.2406458, -1.043113, 1, 0, 0, 1, 1,
-0.6291635, -0.8527119, -2.41184, 1, 0, 0, 1, 1,
-0.6231398, -0.05093478, -2.337107, 1, 0, 0, 1, 1,
-0.619962, 1.403563, -1.982209, 0, 0, 0, 1, 1,
-0.6173469, -0.2081383, -2.14706, 0, 0, 0, 1, 1,
-0.6141489, -1.360917, -1.836798, 0, 0, 0, 1, 1,
-0.6138967, -0.2064705, -2.614048, 0, 0, 0, 1, 1,
-0.6135806, -0.8763738, -1.290106, 0, 0, 0, 1, 1,
-0.6135728, -0.6372816, -2.950499, 0, 0, 0, 1, 1,
-0.6131364, -0.849445, -4.066083, 0, 0, 0, 1, 1,
-0.6094307, 0.03313035, -1.02005, 1, 1, 1, 1, 1,
-0.6033101, -0.8942497, -1.56865, 1, 1, 1, 1, 1,
-0.6031842, -1.232282, -3.595019, 1, 1, 1, 1, 1,
-0.6022489, -0.5371287, -1.747276, 1, 1, 1, 1, 1,
-0.5953028, 0.7910607, -1.244928, 1, 1, 1, 1, 1,
-0.5940746, 0.7822195, -0.7958372, 1, 1, 1, 1, 1,
-0.5914115, -0.1770116, -1.319771, 1, 1, 1, 1, 1,
-0.5900186, 1.444782, -2.674245, 1, 1, 1, 1, 1,
-0.5883458, -0.6889705, -1.201133, 1, 1, 1, 1, 1,
-0.5850735, -0.9517769, -1.542285, 1, 1, 1, 1, 1,
-0.5807723, -1.155618, -3.299079, 1, 1, 1, 1, 1,
-0.5805628, 0.3073123, -1.908531, 1, 1, 1, 1, 1,
-0.5801865, 1.240832, -1.255122, 1, 1, 1, 1, 1,
-0.5754702, 1.406256, -0.5168491, 1, 1, 1, 1, 1,
-0.5725482, -0.4151409, -1.232544, 1, 1, 1, 1, 1,
-0.5695917, 0.6079314, -0.2861299, 0, 0, 1, 1, 1,
-0.5658715, -0.6750291, -1.509101, 1, 0, 0, 1, 1,
-0.5658041, -0.08687667, -1.136626, 1, 0, 0, 1, 1,
-0.5652216, 1.376057, -0.9564695, 1, 0, 0, 1, 1,
-0.5650992, 0.5142625, -0.07127891, 1, 0, 0, 1, 1,
-0.5635598, -0.5327156, -3.630862, 1, 0, 0, 1, 1,
-0.5606802, 0.574375, -0.5127484, 0, 0, 0, 1, 1,
-0.5597277, -0.258717, -2.583568, 0, 0, 0, 1, 1,
-0.5561996, -1.539043, -2.589591, 0, 0, 0, 1, 1,
-0.5515656, -1.029376, -3.834903, 0, 0, 0, 1, 1,
-0.5508447, -0.07361759, -1.285794, 0, 0, 0, 1, 1,
-0.5498181, -1.312558, -2.977581, 0, 0, 0, 1, 1,
-0.5497023, 2.030635, -1.097752, 0, 0, 0, 1, 1,
-0.5472258, -0.8944822, -3.507485, 1, 1, 1, 1, 1,
-0.5458109, 0.4355385, -0.7387622, 1, 1, 1, 1, 1,
-0.5417004, -0.1001476, -0.61728, 1, 1, 1, 1, 1,
-0.5392826, 1.415155, -0.9402995, 1, 1, 1, 1, 1,
-0.5281534, -1.519809, -4.07482, 1, 1, 1, 1, 1,
-0.5271927, 0.6591743, -1.226321, 1, 1, 1, 1, 1,
-0.5269763, 0.5080363, -0.4523892, 1, 1, 1, 1, 1,
-0.5256059, -1.495497, -3.018142, 1, 1, 1, 1, 1,
-0.5250161, -1.311939, -2.223188, 1, 1, 1, 1, 1,
-0.5242896, -0.3430144, -2.197236, 1, 1, 1, 1, 1,
-0.5228115, 0.1261754, -1.441324, 1, 1, 1, 1, 1,
-0.5213, 0.5525601, -0.7407568, 1, 1, 1, 1, 1,
-0.5195195, 0.645005, -0.4254737, 1, 1, 1, 1, 1,
-0.5157361, -0.2583365, -1.972964, 1, 1, 1, 1, 1,
-0.5152954, 0.8963377, -1.222516, 1, 1, 1, 1, 1,
-0.5138798, -0.7067134, -3.121785, 0, 0, 1, 1, 1,
-0.5097542, -0.5291842, -2.319285, 1, 0, 0, 1, 1,
-0.5096054, -0.8237079, -1.255059, 1, 0, 0, 1, 1,
-0.5049521, 0.2758824, -0.6820505, 1, 0, 0, 1, 1,
-0.5026139, 0.982216, 0.2127691, 1, 0, 0, 1, 1,
-0.5003091, 0.8664196, 0.7558383, 1, 0, 0, 1, 1,
-0.4946197, 0.09422282, -1.055745, 0, 0, 0, 1, 1,
-0.4894516, -0.709371, -1.548288, 0, 0, 0, 1, 1,
-0.4887068, -2.030588, -2.313757, 0, 0, 0, 1, 1,
-0.4870829, -0.9816781, -2.222079, 0, 0, 0, 1, 1,
-0.4859572, -0.469901, -1.632354, 0, 0, 0, 1, 1,
-0.4850554, -0.7753603, -2.74808, 0, 0, 0, 1, 1,
-0.4834091, 0.9284928, -0.9777411, 0, 0, 0, 1, 1,
-0.4830837, 0.203004, -1.303433, 1, 1, 1, 1, 1,
-0.4825985, 0.4567876, -2.238533, 1, 1, 1, 1, 1,
-0.4800042, 1.253486, -0.7059456, 1, 1, 1, 1, 1,
-0.4747966, -0.7915866, -2.704801, 1, 1, 1, 1, 1,
-0.4741617, 1.179615, -0.9781111, 1, 1, 1, 1, 1,
-0.4694937, 1.145604, -0.595004, 1, 1, 1, 1, 1,
-0.4646952, 1.725286, 2.702761, 1, 1, 1, 1, 1,
-0.4634736, -0.7668449, -2.785974, 1, 1, 1, 1, 1,
-0.4607821, 0.3164821, -0.3638889, 1, 1, 1, 1, 1,
-0.4589413, 0.7211805, -0.1119899, 1, 1, 1, 1, 1,
-0.4582241, -1.242556, -1.064722, 1, 1, 1, 1, 1,
-0.4515184, -0.7983987, -2.405372, 1, 1, 1, 1, 1,
-0.4512941, -0.1883364, -2.211877, 1, 1, 1, 1, 1,
-0.4486824, -0.183505, -2.901223, 1, 1, 1, 1, 1,
-0.4462821, 0.270215, 0.2080233, 1, 1, 1, 1, 1,
-0.4450027, 1.135713, -1.912228, 0, 0, 1, 1, 1,
-0.4397738, -1.251861, -3.764266, 1, 0, 0, 1, 1,
-0.439437, -1.024635, -2.659206, 1, 0, 0, 1, 1,
-0.4361107, -0.5162044, -0.6536232, 1, 0, 0, 1, 1,
-0.435238, 0.5275416, -0.5367489, 1, 0, 0, 1, 1,
-0.4335477, -0.2637575, -3.927085, 1, 0, 0, 1, 1,
-0.4319806, -0.3377053, -2.413393, 0, 0, 0, 1, 1,
-0.4310168, 1.871074, -0.8106177, 0, 0, 0, 1, 1,
-0.4284909, 0.5550716, -0.3027631, 0, 0, 0, 1, 1,
-0.427095, 0.03723192, -1.599722, 0, 0, 0, 1, 1,
-0.4270653, 0.1019578, -2.459546, 0, 0, 0, 1, 1,
-0.42665, 0.6363689, -0.8415933, 0, 0, 0, 1, 1,
-0.4206389, -1.541117, -3.136207, 0, 0, 0, 1, 1,
-0.4188306, 0.3123752, 0.6632849, 1, 1, 1, 1, 1,
-0.4181949, 0.06288238, -1.689757, 1, 1, 1, 1, 1,
-0.4171595, -0.4172002, -2.526086, 1, 1, 1, 1, 1,
-0.4125923, -0.1365452, -2.6511, 1, 1, 1, 1, 1,
-0.4118532, 0.4437697, 0.930239, 1, 1, 1, 1, 1,
-0.4096805, 0.1115539, 0.04445321, 1, 1, 1, 1, 1,
-0.4086533, 1.003971, 0.5147423, 1, 1, 1, 1, 1,
-0.4072295, 0.7151119, 0.5902541, 1, 1, 1, 1, 1,
-0.4071148, 0.3563567, 0.2670174, 1, 1, 1, 1, 1,
-0.4065673, -0.5252627, -2.625207, 1, 1, 1, 1, 1,
-0.3928061, -2.222731, -3.302329, 1, 1, 1, 1, 1,
-0.3821763, -1.783158, -3.591192, 1, 1, 1, 1, 1,
-0.3813452, 0.5497431, -0.06755109, 1, 1, 1, 1, 1,
-0.3768768, -0.9337537, -2.897942, 1, 1, 1, 1, 1,
-0.3758921, -1.511736, -2.513422, 1, 1, 1, 1, 1,
-0.3741772, 0.6599522, 0.05038853, 0, 0, 1, 1, 1,
-0.3735582, 0.1294843, -0.8977071, 1, 0, 0, 1, 1,
-0.3699248, -0.2268816, -1.1436, 1, 0, 0, 1, 1,
-0.3655457, -0.5668659, -2.904363, 1, 0, 0, 1, 1,
-0.3633687, -0.4007704, -1.790455, 1, 0, 0, 1, 1,
-0.3631708, 0.6924062, -1.035456, 1, 0, 0, 1, 1,
-0.36166, -0.07906653, -2.557029, 0, 0, 0, 1, 1,
-0.3615007, 0.08412468, -2.108264, 0, 0, 0, 1, 1,
-0.3512424, 1.105859, -2.020164, 0, 0, 0, 1, 1,
-0.3505366, 0.2585468, -1.029822, 0, 0, 0, 1, 1,
-0.3418368, 1.231465, 1.444986, 0, 0, 0, 1, 1,
-0.3413458, -0.8707621, -1.94165, 0, 0, 0, 1, 1,
-0.341316, 0.261723, -1.603174, 0, 0, 0, 1, 1,
-0.3381098, 0.05370159, -0.6430188, 1, 1, 1, 1, 1,
-0.3330861, 0.02298208, -1.296328, 1, 1, 1, 1, 1,
-0.3326788, 0.4830177, -0.9487084, 1, 1, 1, 1, 1,
-0.3324288, -0.6537038, -1.664043, 1, 1, 1, 1, 1,
-0.3301758, -1.090284, -3.789284, 1, 1, 1, 1, 1,
-0.3297423, 1.041115, -0.03848446, 1, 1, 1, 1, 1,
-0.3279139, -0.5097614, -3.148824, 1, 1, 1, 1, 1,
-0.3250808, -0.2873947, -1.684056, 1, 1, 1, 1, 1,
-0.322867, -1.423599, -1.590604, 1, 1, 1, 1, 1,
-0.3215317, 0.9457692, -0.4015756, 1, 1, 1, 1, 1,
-0.3178498, 0.1659882, -0.4473557, 1, 1, 1, 1, 1,
-0.3166671, -0.01235071, -0.9758281, 1, 1, 1, 1, 1,
-0.3156962, 0.1380107, -0.5272949, 1, 1, 1, 1, 1,
-0.3105281, 2.521528, -0.1937992, 1, 1, 1, 1, 1,
-0.3001752, -0.5749257, -1.594369, 1, 1, 1, 1, 1,
-0.2962764, 0.5908949, 0.1738344, 0, 0, 1, 1, 1,
-0.2949065, -0.1717633, -1.547208, 1, 0, 0, 1, 1,
-0.2943787, -0.0620646, -2.210025, 1, 0, 0, 1, 1,
-0.2907898, 0.174817, -0.3732814, 1, 0, 0, 1, 1,
-0.2851027, -0.2367323, -1.590762, 1, 0, 0, 1, 1,
-0.2810859, 1.29099, -0.3607385, 1, 0, 0, 1, 1,
-0.2806804, -0.3966872, -4.36624, 0, 0, 0, 1, 1,
-0.2798629, -0.8850866, -3.27482, 0, 0, 0, 1, 1,
-0.2797785, 0.5968463, 1.557293, 0, 0, 0, 1, 1,
-0.2773194, 0.9627365, 1.41807, 0, 0, 0, 1, 1,
-0.2725056, 0.5545224, 0.4079486, 0, 0, 0, 1, 1,
-0.2710505, 0.07937759, -1.144351, 0, 0, 0, 1, 1,
-0.2644592, 0.9344991, -0.5210046, 0, 0, 0, 1, 1,
-0.2590054, 1.476159, 1.710352, 1, 1, 1, 1, 1,
-0.2519293, -0.3656008, -1.575389, 1, 1, 1, 1, 1,
-0.2501964, 0.4519113, -1.669432, 1, 1, 1, 1, 1,
-0.2471348, 0.07426227, 1.251957, 1, 1, 1, 1, 1,
-0.2430693, 0.6033056, -1.545243, 1, 1, 1, 1, 1,
-0.2417196, -1.648965, -1.381562, 1, 1, 1, 1, 1,
-0.2397037, -0.7101752, -2.540679, 1, 1, 1, 1, 1,
-0.2326595, -1.514695, -3.12506, 1, 1, 1, 1, 1,
-0.2322234, -0.5191916, -2.79666, 1, 1, 1, 1, 1,
-0.2315779, -0.9558744, -2.369032, 1, 1, 1, 1, 1,
-0.2271808, 0.2394164, 0.03120963, 1, 1, 1, 1, 1,
-0.2264825, -0.5272008, -1.469986, 1, 1, 1, 1, 1,
-0.2234719, 0.5640569, -0.9131954, 1, 1, 1, 1, 1,
-0.2229432, 0.7142448, -0.9995509, 1, 1, 1, 1, 1,
-0.2210872, 0.3008688, 0.2794491, 1, 1, 1, 1, 1,
-0.2209587, -2.340298, -2.132041, 0, 0, 1, 1, 1,
-0.2180296, 0.4554761, -0.3839163, 1, 0, 0, 1, 1,
-0.2168994, 0.9181489, -1.244407, 1, 0, 0, 1, 1,
-0.2155099, -0.3328417, -3.679307, 1, 0, 0, 1, 1,
-0.2138198, 1.08534, -0.4173894, 1, 0, 0, 1, 1,
-0.2089945, 0.5750141, 1.458296, 1, 0, 0, 1, 1,
-0.2074162, -0.3605492, -2.680709, 0, 0, 0, 1, 1,
-0.2072786, -0.04077476, -1.563609, 0, 0, 0, 1, 1,
-0.2062659, 0.7124815, -1.690662, 0, 0, 0, 1, 1,
-0.2015219, -1.636467, -4.129909, 0, 0, 0, 1, 1,
-0.1939638, 0.004976939, -1.61681, 0, 0, 0, 1, 1,
-0.1931409, 0.08301874, -2.71605, 0, 0, 0, 1, 1,
-0.1922746, 1.850189, -0.1380938, 0, 0, 0, 1, 1,
-0.1816534, -0.4119255, -1.237663, 1, 1, 1, 1, 1,
-0.1778715, -0.6069528, -2.427339, 1, 1, 1, 1, 1,
-0.1768656, 1.128675, -2.64911, 1, 1, 1, 1, 1,
-0.1763912, 1.662146, -0.453909, 1, 1, 1, 1, 1,
-0.1699422, 0.4482357, -0.3147657, 1, 1, 1, 1, 1,
-0.1639265, -0.2654104, -1.686167, 1, 1, 1, 1, 1,
-0.1613573, 1.590796, -1.805535, 1, 1, 1, 1, 1,
-0.1600924, -0.6417451, -2.333774, 1, 1, 1, 1, 1,
-0.1599924, -0.2063642, 0.1889745, 1, 1, 1, 1, 1,
-0.1599094, 1.235013, -1.978914, 1, 1, 1, 1, 1,
-0.1597538, 0.5510213, -0.6050279, 1, 1, 1, 1, 1,
-0.1583598, 1.188329, 0.1024934, 1, 1, 1, 1, 1,
-0.1532933, -0.8320946, -4.619108, 1, 1, 1, 1, 1,
-0.1530657, -1.744123, -3.79852, 1, 1, 1, 1, 1,
-0.1526856, -0.4470951, -2.892255, 1, 1, 1, 1, 1,
-0.1500436, -0.2526444, -1.2631, 0, 0, 1, 1, 1,
-0.149114, 1.731797, 0.2675032, 1, 0, 0, 1, 1,
-0.1451182, -0.3312394, -2.180891, 1, 0, 0, 1, 1,
-0.1411804, 0.2057864, 0.8656967, 1, 0, 0, 1, 1,
-0.1411467, -0.31542, -3.234406, 1, 0, 0, 1, 1,
-0.1411148, -0.0643116, -1.460763, 1, 0, 0, 1, 1,
-0.136608, -2.151958, -0.9549575, 0, 0, 0, 1, 1,
-0.1292057, -1.529424, -3.040719, 0, 0, 0, 1, 1,
-0.128046, 1.074297, -0.3858709, 0, 0, 0, 1, 1,
-0.1280378, 1.632255, -0.7273659, 0, 0, 0, 1, 1,
-0.1259196, 0.07656197, -0.991686, 0, 0, 0, 1, 1,
-0.1247732, -1.213968, -2.209298, 0, 0, 0, 1, 1,
-0.1240389, -1.723117, -1.919325, 0, 0, 0, 1, 1,
-0.1226553, -1.015997, -1.48407, 1, 1, 1, 1, 1,
-0.1196608, -1.308936, -2.968457, 1, 1, 1, 1, 1,
-0.1179088, -0.4485141, -3.227755, 1, 1, 1, 1, 1,
-0.1177234, 0.6107541, -0.9687248, 1, 1, 1, 1, 1,
-0.1160732, 0.6197194, 1.444866, 1, 1, 1, 1, 1,
-0.1151067, 0.2306752, 0.2930466, 1, 1, 1, 1, 1,
-0.1041856, 0.5561415, 0.4285718, 1, 1, 1, 1, 1,
-0.09568041, -0.2717035, -2.688987, 1, 1, 1, 1, 1,
-0.08847616, 0.1813012, -0.2116529, 1, 1, 1, 1, 1,
-0.08813164, -0.8320833, -3.730012, 1, 1, 1, 1, 1,
-0.08482069, 0.599719, -0.8598296, 1, 1, 1, 1, 1,
-0.08444061, 0.4457453, 1.141441, 1, 1, 1, 1, 1,
-0.08136265, -0.3672083, -2.151545, 1, 1, 1, 1, 1,
-0.07424382, -0.3720258, -4.239747, 1, 1, 1, 1, 1,
-0.07372034, 0.8685951, -0.3546953, 1, 1, 1, 1, 1,
-0.07072789, 0.3708249, 0.02149722, 0, 0, 1, 1, 1,
-0.07008027, -1.192739, -2.83103, 1, 0, 0, 1, 1,
-0.06804183, 0.03287617, -1.204921, 1, 0, 0, 1, 1,
-0.06475908, 0.6914296, -0.09002674, 1, 0, 0, 1, 1,
-0.06147402, 0.9595096, 0.6031485, 1, 0, 0, 1, 1,
-0.05881881, 1.837955, -0.8250039, 1, 0, 0, 1, 1,
-0.0583447, -0.2284642, -3.986126, 0, 0, 0, 1, 1,
-0.05665157, 1.400951, 0.3343073, 0, 0, 0, 1, 1,
-0.05646427, -0.1125843, -3.249435, 0, 0, 0, 1, 1,
-0.04800215, -1.524617, -3.667086, 0, 0, 0, 1, 1,
-0.04735226, 2.44392, -2.466656, 0, 0, 0, 1, 1,
-0.0424282, -0.6755909, -1.972891, 0, 0, 0, 1, 1,
-0.03805839, 0.08822872, 0.5993041, 0, 0, 0, 1, 1,
-0.03790462, 2.124487, 0.6805493, 1, 1, 1, 1, 1,
-0.03333034, 0.1495465, -0.7743023, 1, 1, 1, 1, 1,
-0.03217652, 0.5648838, -0.07676782, 1, 1, 1, 1, 1,
-0.02680976, 0.2810646, -0.05741645, 1, 1, 1, 1, 1,
-0.0247854, -1.604608, -3.123381, 1, 1, 1, 1, 1,
-0.02211458, -1.906054, -4.44058, 1, 1, 1, 1, 1,
-0.02159498, 0.0107627, -1.745733, 1, 1, 1, 1, 1,
-0.02129024, -0.546246, -1.581961, 1, 1, 1, 1, 1,
-0.01891766, -0.6588928, -2.485883, 1, 1, 1, 1, 1,
-0.01496724, 1.688313, 0.4266884, 1, 1, 1, 1, 1,
-0.01371485, -1.140345, -3.287706, 1, 1, 1, 1, 1,
-0.01350393, 0.5953561, -1.098039, 1, 1, 1, 1, 1,
-0.01203763, -1.001744, -4.769341, 1, 1, 1, 1, 1,
-0.008043017, 0.5112363, -0.3174115, 1, 1, 1, 1, 1,
-0.005684992, -0.04388405, -2.055564, 1, 1, 1, 1, 1,
-0.00378977, 0.4788602, -0.5595506, 0, 0, 1, 1, 1,
-0.003544369, -0.5729478, -2.299671, 1, 0, 0, 1, 1,
-0.001293142, -0.134305, -2.748997, 1, 0, 0, 1, 1,
-0.0001766759, 1.335719, -0.4118129, 1, 0, 0, 1, 1,
0.002420727, 0.9508402, 1.016961, 1, 0, 0, 1, 1,
0.0110581, -1.611804, 3.124876, 1, 0, 0, 1, 1,
0.01290798, -0.3452902, 4.323053, 0, 0, 0, 1, 1,
0.02116657, -0.2727666, 4.082902, 0, 0, 0, 1, 1,
0.02546967, -0.5998606, 2.446812, 0, 0, 0, 1, 1,
0.03188452, 2.078604, 2.098349, 0, 0, 0, 1, 1,
0.03271203, -0.4077402, 2.959042, 0, 0, 0, 1, 1,
0.04106221, 0.274818, 0.2896768, 0, 0, 0, 1, 1,
0.04571348, -0.3293622, 5.251415, 0, 0, 0, 1, 1,
0.04977919, -0.06449252, 2.523982, 1, 1, 1, 1, 1,
0.05091496, 0.4889057, 0.6164379, 1, 1, 1, 1, 1,
0.05096957, 0.5280098, 1.587611, 1, 1, 1, 1, 1,
0.05128025, 0.4726648, 1.257633, 1, 1, 1, 1, 1,
0.05304267, 2.708798, -0.2300567, 1, 1, 1, 1, 1,
0.05486204, 2.520468, 0.2182976, 1, 1, 1, 1, 1,
0.05706429, -0.5304539, 3.895887, 1, 1, 1, 1, 1,
0.05761631, 0.3169532, -0.7811731, 1, 1, 1, 1, 1,
0.057923, 0.7408891, 1.032711, 1, 1, 1, 1, 1,
0.06152347, -2.094787, 2.999917, 1, 1, 1, 1, 1,
0.06955166, -1.764458, 3.334413, 1, 1, 1, 1, 1,
0.07152271, 0.9401019, -1.768873, 1, 1, 1, 1, 1,
0.07325708, 0.4843375, -0.1408401, 1, 1, 1, 1, 1,
0.07393195, -1.535974, 1.763463, 1, 1, 1, 1, 1,
0.0742604, 0.1184246, 0.9903744, 1, 1, 1, 1, 1,
0.07449839, -0.5048802, 4.021199, 0, 0, 1, 1, 1,
0.0796441, -1.18211, 4.297503, 1, 0, 0, 1, 1,
0.08057975, 0.4584054, 1.01752, 1, 0, 0, 1, 1,
0.08089802, 0.8090174, -0.3775631, 1, 0, 0, 1, 1,
0.08348615, 0.5088779, 0.673437, 1, 0, 0, 1, 1,
0.08511123, 0.1096969, 0.5576782, 1, 0, 0, 1, 1,
0.08827731, -1.951302, 2.26939, 0, 0, 0, 1, 1,
0.0883805, -0.3669067, 2.909817, 0, 0, 0, 1, 1,
0.08867107, -0.225668, 2.551514, 0, 0, 0, 1, 1,
0.09140516, -0.9380048, 3.645468, 0, 0, 0, 1, 1,
0.0922331, 0.6064425, 1.756107, 0, 0, 0, 1, 1,
0.09791127, -0.8235444, 4.294033, 0, 0, 0, 1, 1,
0.09982565, -1.081897, 3.292037, 0, 0, 0, 1, 1,
0.1003738, 0.7288856, -0.5895343, 1, 1, 1, 1, 1,
0.1050324, 0.04050068, 1.453247, 1, 1, 1, 1, 1,
0.1057743, -0.6903121, 2.771449, 1, 1, 1, 1, 1,
0.1076066, 1.140132, -0.6674178, 1, 1, 1, 1, 1,
0.1076864, 0.6375294, 1.071524, 1, 1, 1, 1, 1,
0.1115259, 0.543345, -0.2228098, 1, 1, 1, 1, 1,
0.1118768, -0.4757993, 2.789808, 1, 1, 1, 1, 1,
0.1152121, -0.2338259, 3.675074, 1, 1, 1, 1, 1,
0.1169592, -0.1230812, 2.370673, 1, 1, 1, 1, 1,
0.1282468, 1.91883, -0.8114804, 1, 1, 1, 1, 1,
0.1301285, 1.177091, -1.608334, 1, 1, 1, 1, 1,
0.1424281, -1.131102, 1.739857, 1, 1, 1, 1, 1,
0.1436312, 0.8631603, 0.3970785, 1, 1, 1, 1, 1,
0.1455234, 1.10748, 0.152963, 1, 1, 1, 1, 1,
0.1474598, -0.4564662, 3.148797, 1, 1, 1, 1, 1,
0.1577942, 0.4342152, 1.713372, 0, 0, 1, 1, 1,
0.1583925, 0.3641409, -1.742728, 1, 0, 0, 1, 1,
0.1598499, 1.552677, -1.277057, 1, 0, 0, 1, 1,
0.1600767, -0.3552587, 3.362195, 1, 0, 0, 1, 1,
0.1602813, -0.06128417, -0.03281845, 1, 0, 0, 1, 1,
0.1628827, -0.9515958, 2.049974, 1, 0, 0, 1, 1,
0.1632247, 0.4872622, -0.7335825, 0, 0, 0, 1, 1,
0.1638813, -1.099908, 3.786839, 0, 0, 0, 1, 1,
0.1653132, 0.4496436, 0.1305008, 0, 0, 0, 1, 1,
0.1676331, 1.23229, -1.529993, 0, 0, 0, 1, 1,
0.1694062, 0.6704565, 0.4211359, 0, 0, 0, 1, 1,
0.1733794, -0.9330511, 4.26976, 0, 0, 0, 1, 1,
0.1739931, -0.05993864, -0.02470439, 0, 0, 0, 1, 1,
0.1749357, -0.05324611, 0.4002262, 1, 1, 1, 1, 1,
0.1762505, 1.406523, 0.82782, 1, 1, 1, 1, 1,
0.1829311, 0.02237264, -0.05774747, 1, 1, 1, 1, 1,
0.1832353, 0.5587162, 0.1240698, 1, 1, 1, 1, 1,
0.1854987, -0.8288801, 3.140103, 1, 1, 1, 1, 1,
0.1863865, 0.9862623, -0.5867144, 1, 1, 1, 1, 1,
0.1870566, 0.3446054, 0.4596168, 1, 1, 1, 1, 1,
0.1894081, 0.6869479, -0.5086101, 1, 1, 1, 1, 1,
0.1912837, 0.7103326, -1.144268, 1, 1, 1, 1, 1,
0.1916621, 0.6409272, -0.3249466, 1, 1, 1, 1, 1,
0.1918817, 1.678225, -0.03774368, 1, 1, 1, 1, 1,
0.1974795, -1.474371, 2.986471, 1, 1, 1, 1, 1,
0.2013907, -0.6191978, 2.86039, 1, 1, 1, 1, 1,
0.2027389, -1.728447, -0.2151987, 1, 1, 1, 1, 1,
0.2030461, 0.7582951, -0.2701364, 1, 1, 1, 1, 1,
0.2049374, 0.4169274, 1.24412, 0, 0, 1, 1, 1,
0.205365, 1.749514, 0.4312456, 1, 0, 0, 1, 1,
0.2101499, -0.06393387, 1.344839, 1, 0, 0, 1, 1,
0.2120074, 0.353353, 0.2064181, 1, 0, 0, 1, 1,
0.2132666, -0.5650533, 2.660039, 1, 0, 0, 1, 1,
0.2159467, 0.2494284, -0.5877482, 1, 0, 0, 1, 1,
0.2175947, 0.4819457, 1.533523, 0, 0, 0, 1, 1,
0.2211813, -1.67252, 3.491241, 0, 0, 0, 1, 1,
0.2279055, 0.3301362, -0.4552553, 0, 0, 0, 1, 1,
0.2344252, 1.973498, 0.7408946, 0, 0, 0, 1, 1,
0.2370046, -1.606914, 1.698163, 0, 0, 0, 1, 1,
0.2385357, -1.509709, 2.802958, 0, 0, 0, 1, 1,
0.2395453, -1.074238, 1.62108, 0, 0, 0, 1, 1,
0.2471705, -2.455221, 3.628313, 1, 1, 1, 1, 1,
0.2474202, -0.0341825, 1.674086, 1, 1, 1, 1, 1,
0.2580084, 1.059107, 0.6201419, 1, 1, 1, 1, 1,
0.2582847, -1.336134, 3.198087, 1, 1, 1, 1, 1,
0.2632427, 1.718056, -0.4569839, 1, 1, 1, 1, 1,
0.2643839, 0.3209719, 1.960324, 1, 1, 1, 1, 1,
0.2663421, 0.2466883, 1.438366, 1, 1, 1, 1, 1,
0.2744234, 1.009577, 0.5456793, 1, 1, 1, 1, 1,
0.2772342, 2.059029, 1.037492, 1, 1, 1, 1, 1,
0.2782434, 0.8536149, 0.8855886, 1, 1, 1, 1, 1,
0.284748, 0.4000974, 0.3923995, 1, 1, 1, 1, 1,
0.2916283, 0.5882285, 2.295902, 1, 1, 1, 1, 1,
0.2933974, 0.7810723, 0.5591211, 1, 1, 1, 1, 1,
0.2942748, -0.3426475, 2.482075, 1, 1, 1, 1, 1,
0.2946226, -0.934675, 2.288518, 1, 1, 1, 1, 1,
0.3026911, -1.176492, 3.164328, 0, 0, 1, 1, 1,
0.3027689, -1.312945, 2.341574, 1, 0, 0, 1, 1,
0.3060874, 0.3804172, 1.976731, 1, 0, 0, 1, 1,
0.3075947, 0.4615861, 1.760417, 1, 0, 0, 1, 1,
0.308098, -1.238058, 3.225349, 1, 0, 0, 1, 1,
0.3130553, -0.1375757, 2.37149, 1, 0, 0, 1, 1,
0.315314, -1.684103, 5.228718, 0, 0, 0, 1, 1,
0.3158226, -0.2219168, 2.059607, 0, 0, 0, 1, 1,
0.3159656, 1.002024, -1.172487, 0, 0, 0, 1, 1,
0.3187356, 0.1675835, 0.9766769, 0, 0, 0, 1, 1,
0.3188196, -0.7504762, 2.611724, 0, 0, 0, 1, 1,
0.3214227, -1.164278, 2.565248, 0, 0, 0, 1, 1,
0.3269423, 0.8306442, -1.313538, 0, 0, 0, 1, 1,
0.3276894, 0.5225692, 0.9876524, 1, 1, 1, 1, 1,
0.3285036, -0.1804058, 1.825983, 1, 1, 1, 1, 1,
0.3286422, -0.550585, 2.167182, 1, 1, 1, 1, 1,
0.3286543, -1.046648, 3.677108, 1, 1, 1, 1, 1,
0.3299083, 1.348422, 0.1041316, 1, 1, 1, 1, 1,
0.3304479, 1.734608, 1.718656, 1, 1, 1, 1, 1,
0.3305772, -0.1402129, 1.872854, 1, 1, 1, 1, 1,
0.3314644, 0.7958124, -1.628094, 1, 1, 1, 1, 1,
0.3322615, -1.550962, 2.605358, 1, 1, 1, 1, 1,
0.3324334, -0.5005792, 2.527031, 1, 1, 1, 1, 1,
0.3329432, -1.529899, 3.243633, 1, 1, 1, 1, 1,
0.3350509, 0.5355642, 1.597205, 1, 1, 1, 1, 1,
0.3351215, -0.3550733, 2.206116, 1, 1, 1, 1, 1,
0.3355532, 0.7081566, 1.569958, 1, 1, 1, 1, 1,
0.3380187, 0.876684, 0.3108415, 1, 1, 1, 1, 1,
0.3384991, 0.9405764, 0.4745187, 0, 0, 1, 1, 1,
0.3388752, -1.189162, 2.433088, 1, 0, 0, 1, 1,
0.344327, 1.040646, 0.4985388, 1, 0, 0, 1, 1,
0.3446867, -0.5510116, 2.475567, 1, 0, 0, 1, 1,
0.3508792, 1.520358, -0.2396446, 1, 0, 0, 1, 1,
0.3519845, -1.845147, 2.803706, 1, 0, 0, 1, 1,
0.353808, 0.4855667, 1.363617, 0, 0, 0, 1, 1,
0.3569157, -0.4048202, 2.731066, 0, 0, 0, 1, 1,
0.3594906, 0.04030469, 2.23986, 0, 0, 0, 1, 1,
0.3625538, -0.4079873, 1.941445, 0, 0, 0, 1, 1,
0.3630283, 0.01163615, 1.562319, 0, 0, 0, 1, 1,
0.3641725, -0.2879957, 1.819296, 0, 0, 0, 1, 1,
0.3650385, -1.056881, 3.334588, 0, 0, 0, 1, 1,
0.3653083, -2.617352, 3.007082, 1, 1, 1, 1, 1,
0.3699929, -1.161574, 3.495926, 1, 1, 1, 1, 1,
0.3713044, -2.352887, 2.735719, 1, 1, 1, 1, 1,
0.3713408, 0.6721426, 1.317566, 1, 1, 1, 1, 1,
0.3736325, -0.3771801, 1.983572, 1, 1, 1, 1, 1,
0.3757392, 0.6241149, 2.37521, 1, 1, 1, 1, 1,
0.3775356, 0.4525942, 2.15265, 1, 1, 1, 1, 1,
0.3792943, -0.673791, 2.688978, 1, 1, 1, 1, 1,
0.3840405, 1.578694, 0.9847117, 1, 1, 1, 1, 1,
0.3880494, -1.410163, 2.474383, 1, 1, 1, 1, 1,
0.3911861, 1.471515, 0.6877593, 1, 1, 1, 1, 1,
0.3914644, -0.1561149, 1.877699, 1, 1, 1, 1, 1,
0.3920586, 0.3672216, 0.7605587, 1, 1, 1, 1, 1,
0.3961737, 0.9920084, 0.9580019, 1, 1, 1, 1, 1,
0.3966725, -1.761039, 3.200857, 1, 1, 1, 1, 1,
0.3991565, -0.7783151, 2.650577, 0, 0, 1, 1, 1,
0.4001302, -0.5207832, 1.718689, 1, 0, 0, 1, 1,
0.4002514, -0.828212, 4.915824, 1, 0, 0, 1, 1,
0.4070563, -0.1126853, 0.09198278, 1, 0, 0, 1, 1,
0.409439, -0.6207611, 1.949914, 1, 0, 0, 1, 1,
0.410153, 1.111812, 1.719274, 1, 0, 0, 1, 1,
0.4110928, -0.3292291, 1.776866, 0, 0, 0, 1, 1,
0.416658, -0.4646085, 3.144102, 0, 0, 0, 1, 1,
0.426255, -0.8283824, 2.354924, 0, 0, 0, 1, 1,
0.4266505, -0.2597302, 0.1232604, 0, 0, 0, 1, 1,
0.4269645, -0.272198, 1.07649, 0, 0, 0, 1, 1,
0.4272941, -1.845863, 4.61365, 0, 0, 0, 1, 1,
0.4302081, -1.60347, 4.602278, 0, 0, 0, 1, 1,
0.4329079, -0.8143377, 2.594033, 1, 1, 1, 1, 1,
0.4353641, -1.905947, 2.693046, 1, 1, 1, 1, 1,
0.4384363, -0.6522241, 3.253201, 1, 1, 1, 1, 1,
0.4385005, -1.19203, 2.224406, 1, 1, 1, 1, 1,
0.4467928, 0.07128074, 1.100879, 1, 1, 1, 1, 1,
0.4486762, 1.810685, 0.4417299, 1, 1, 1, 1, 1,
0.4486951, -0.8108701, 2.943774, 1, 1, 1, 1, 1,
0.4505871, 0.0136637, 2.927373, 1, 1, 1, 1, 1,
0.4525944, 0.4047508, 1.386946, 1, 1, 1, 1, 1,
0.4531003, -1.541362, 2.145088, 1, 1, 1, 1, 1,
0.4621476, 1.344847, 1.171259, 1, 1, 1, 1, 1,
0.4670841, -0.2340794, 2.071468, 1, 1, 1, 1, 1,
0.4675752, -0.1421043, 2.471894, 1, 1, 1, 1, 1,
0.46874, -0.2603103, 0.7430354, 1, 1, 1, 1, 1,
0.4757262, 0.7398232, -0.6702083, 1, 1, 1, 1, 1,
0.477724, -0.7619854, 2.803121, 0, 0, 1, 1, 1,
0.4818575, -0.6607205, 2.241369, 1, 0, 0, 1, 1,
0.4830147, -0.7167006, 0.9199924, 1, 0, 0, 1, 1,
0.485675, 0.2392694, 0.9049972, 1, 0, 0, 1, 1,
0.4893764, 0.1420432, 0.4051847, 1, 0, 0, 1, 1,
0.4904357, -0.4697806, 1.759989, 1, 0, 0, 1, 1,
0.4972118, 0.5860308, 1.576779, 0, 0, 0, 1, 1,
0.5013198, 0.9583783, -0.6092793, 0, 0, 0, 1, 1,
0.5065711, 1.005804, 2.536613, 0, 0, 0, 1, 1,
0.5160372, -0.4311315, 0.9696828, 0, 0, 0, 1, 1,
0.5250559, -0.3037919, 3.749498, 0, 0, 0, 1, 1,
0.5262958, 0.1328388, 0.9163622, 0, 0, 0, 1, 1,
0.5274206, -0.2646818, 2.376502, 0, 0, 0, 1, 1,
0.5284032, 1.201386, 1.754393, 1, 1, 1, 1, 1,
0.5288428, -0.5451835, 3.063477, 1, 1, 1, 1, 1,
0.5323183, -0.04008759, 1.134697, 1, 1, 1, 1, 1,
0.537029, -0.8495842, 2.390115, 1, 1, 1, 1, 1,
0.5391393, 0.1202056, 2.854446, 1, 1, 1, 1, 1,
0.5461586, -0.3837784, -1.162932, 1, 1, 1, 1, 1,
0.5524226, -0.257897, 0.5010867, 1, 1, 1, 1, 1,
0.5527506, -0.7047724, 2.474782, 1, 1, 1, 1, 1,
0.5532456, 1.892692, -0.01132727, 1, 1, 1, 1, 1,
0.5536975, -0.7967508, 2.391922, 1, 1, 1, 1, 1,
0.5585734, 0.05174764, 3.082788, 1, 1, 1, 1, 1,
0.5651659, -1.810687, 1.029602, 1, 1, 1, 1, 1,
0.5659932, -0.9302725, 0.6887622, 1, 1, 1, 1, 1,
0.5668514, 0.433769, -1.129937, 1, 1, 1, 1, 1,
0.5679005, 0.9182802, -0.2024097, 1, 1, 1, 1, 1,
0.5765048, -0.5111587, 2.372472, 0, 0, 1, 1, 1,
0.5793747, -0.3852697, 2.252071, 1, 0, 0, 1, 1,
0.5813431, -0.5130302, 2.63852, 1, 0, 0, 1, 1,
0.5840684, 0.287663, 0.7743297, 1, 0, 0, 1, 1,
0.5855169, 0.1653576, 0.4463511, 1, 0, 0, 1, 1,
0.5870645, -0.2733947, 3.771815, 1, 0, 0, 1, 1,
0.592884, -0.4297609, 1.860311, 0, 0, 0, 1, 1,
0.592996, 1.053658, -0.1336186, 0, 0, 0, 1, 1,
0.6016436, -1.099471, 2.852264, 0, 0, 0, 1, 1,
0.6020173, -0.6850142, 2.441669, 0, 0, 0, 1, 1,
0.6082788, -0.3088332, 0.7780885, 0, 0, 0, 1, 1,
0.6169694, 0.9947879, 2.761748, 0, 0, 0, 1, 1,
0.617398, 0.5280475, 1.4362, 0, 0, 0, 1, 1,
0.62022, -0.4228552, 0.6698677, 1, 1, 1, 1, 1,
0.6298738, 2.196465, 0.07283031, 1, 1, 1, 1, 1,
0.6333084, -2.398022, 1.415576, 1, 1, 1, 1, 1,
0.6339695, 0.2026087, -0.2002809, 1, 1, 1, 1, 1,
0.6342887, 1.1853, -0.03459346, 1, 1, 1, 1, 1,
0.6358124, 0.1542265, 0.6536355, 1, 1, 1, 1, 1,
0.6415772, 0.4139636, -0.1667431, 1, 1, 1, 1, 1,
0.6417562, 0.6069167, 1.293722, 1, 1, 1, 1, 1,
0.6423755, -1.411706, 2.987382, 1, 1, 1, 1, 1,
0.6555393, 0.2892708, 2.001375, 1, 1, 1, 1, 1,
0.6556355, -0.1996714, 0.9932907, 1, 1, 1, 1, 1,
0.6577347, 0.2526781, 2.94645, 1, 1, 1, 1, 1,
0.6604511, -0.2819903, 2.271704, 1, 1, 1, 1, 1,
0.6605649, 0.4407237, 0.5943186, 1, 1, 1, 1, 1,
0.6608372, -0.853147, 2.256574, 1, 1, 1, 1, 1,
0.6642617, 1.469588, 1.991377, 0, 0, 1, 1, 1,
0.6722, 0.8911672, -0.6384991, 1, 0, 0, 1, 1,
0.6733153, 0.6668552, -2.4524, 1, 0, 0, 1, 1,
0.6745427, -1.107651, 1.738375, 1, 0, 0, 1, 1,
0.6750197, 0.2023861, 2.383043, 1, 0, 0, 1, 1,
0.6753961, 0.63658, 2.034367, 1, 0, 0, 1, 1,
0.6754563, -1.168435, 2.782406, 0, 0, 0, 1, 1,
0.6782258, 0.210878, -0.6352719, 0, 0, 0, 1, 1,
0.6813228, -0.2261593, 1.503475, 0, 0, 0, 1, 1,
0.6899085, 1.303602, 1.78196, 0, 0, 0, 1, 1,
0.6902425, 1.447462, 1.570138, 0, 0, 0, 1, 1,
0.692272, -0.8749548, 2.791229, 0, 0, 0, 1, 1,
0.694172, 0.1147715, 1.743974, 0, 0, 0, 1, 1,
0.7041809, 0.8375447, 1.292298, 1, 1, 1, 1, 1,
0.704623, -1.078167, 0.8908777, 1, 1, 1, 1, 1,
0.7060162, 0.4422933, 2.009491, 1, 1, 1, 1, 1,
0.7145057, 0.5070739, -0.4797918, 1, 1, 1, 1, 1,
0.719018, -1.127577, 1.90203, 1, 1, 1, 1, 1,
0.7204965, -0.3775561, 2.282366, 1, 1, 1, 1, 1,
0.7222192, -1.002919, 1.276834, 1, 1, 1, 1, 1,
0.7258298, -0.3200715, 2.743348, 1, 1, 1, 1, 1,
0.7343287, 0.664658, 1.427026, 1, 1, 1, 1, 1,
0.7350219, 0.2949396, 1.5523, 1, 1, 1, 1, 1,
0.7384781, 1.87868, 1.169951, 1, 1, 1, 1, 1,
0.7427233, 0.5082514, 1.604224, 1, 1, 1, 1, 1,
0.7464207, -0.9084784, 2.084606, 1, 1, 1, 1, 1,
0.7536595, -0.2123018, 2.137444, 1, 1, 1, 1, 1,
0.7543015, -0.2506801, 2.993159, 1, 1, 1, 1, 1,
0.7577766, 1.715703, 0.03824821, 0, 0, 1, 1, 1,
0.7603308, -0.5647827, 2.300516, 1, 0, 0, 1, 1,
0.7611083, -0.5743424, 1.815959, 1, 0, 0, 1, 1,
0.7618233, -1.763085, 3.813501, 1, 0, 0, 1, 1,
0.7630849, 0.3649017, 0.824658, 1, 0, 0, 1, 1,
0.7691961, -1.063818, 3.670074, 1, 0, 0, 1, 1,
0.7692727, -0.08524901, 1.861006, 0, 0, 0, 1, 1,
0.7717932, -0.2315206, 1.157124, 0, 0, 0, 1, 1,
0.7746579, 1.331478, 1.75136, 0, 0, 0, 1, 1,
0.7756827, 0.4883529, 1.24827, 0, 0, 0, 1, 1,
0.7793753, -0.1353758, 1.753063, 0, 0, 0, 1, 1,
0.782895, -0.5922925, 4.968225, 0, 0, 0, 1, 1,
0.7926875, 0.8958104, -1.045087, 0, 0, 0, 1, 1,
0.7979955, -0.5571394, 1.891958, 1, 1, 1, 1, 1,
0.8005955, -0.4898667, 2.46925, 1, 1, 1, 1, 1,
0.8060144, 0.537083, -0.04945754, 1, 1, 1, 1, 1,
0.8062482, -2.184733, 2.946158, 1, 1, 1, 1, 1,
0.8091002, 0.9545809, 0.703832, 1, 1, 1, 1, 1,
0.8103384, 1.282797, 1.144823, 1, 1, 1, 1, 1,
0.8148314, 0.07184371, 0.3745431, 1, 1, 1, 1, 1,
0.8190197, -0.7443742, 1.895892, 1, 1, 1, 1, 1,
0.8218842, 2.960544, 0.112885, 1, 1, 1, 1, 1,
0.8249148, -0.01135019, 2.246698, 1, 1, 1, 1, 1,
0.8254383, -0.09449986, 2.479238, 1, 1, 1, 1, 1,
0.8258958, 1.232507, 0.5042487, 1, 1, 1, 1, 1,
0.827635, 0.4346476, 2.087831, 1, 1, 1, 1, 1,
0.838232, 0.3775351, 1.207596, 1, 1, 1, 1, 1,
0.8459226, 0.323196, 2.946391, 1, 1, 1, 1, 1,
0.8508798, 2.999656, -0.4279923, 0, 0, 1, 1, 1,
0.851054, 2.295934, 0.5524777, 1, 0, 0, 1, 1,
0.8511372, -0.800245, 2.264869, 1, 0, 0, 1, 1,
0.8522878, -2.078375, 2.477537, 1, 0, 0, 1, 1,
0.8558021, 0.299523, 0.6432108, 1, 0, 0, 1, 1,
0.8572782, -0.7901704, 3.535013, 1, 0, 0, 1, 1,
0.8577304, -0.2245363, 3.376728, 0, 0, 0, 1, 1,
0.861635, 2.287412, -1.457852, 0, 0, 0, 1, 1,
0.8626934, 0.8048851, 0.4580801, 0, 0, 0, 1, 1,
0.8634896, -0.0808077, 3.183112, 0, 0, 0, 1, 1,
0.8638686, 0.6199367, 1.098422, 0, 0, 0, 1, 1,
0.8692839, -0.2333796, 1.406761, 0, 0, 0, 1, 1,
0.8716266, -1.010018, 2.773124, 0, 0, 0, 1, 1,
0.8759779, 0.2035293, 1.404548, 1, 1, 1, 1, 1,
0.8798047, 0.4868605, 2.307615, 1, 1, 1, 1, 1,
0.884841, 0.6971102, 0.05376063, 1, 1, 1, 1, 1,
0.8850545, 1.439906, -0.5907302, 1, 1, 1, 1, 1,
0.8870823, 0.5149881, 1.706108, 1, 1, 1, 1, 1,
0.8878829, 0.09483813, 2.693747, 1, 1, 1, 1, 1,
0.8902191, -1.657095, 3.243483, 1, 1, 1, 1, 1,
0.8921221, 0.8252267, 0.8837609, 1, 1, 1, 1, 1,
0.8959344, -0.1447716, 2.908899, 1, 1, 1, 1, 1,
0.9009198, 1.338408, 2.934388, 1, 1, 1, 1, 1,
0.9014539, -1.428095, 2.690146, 1, 1, 1, 1, 1,
0.9059402, 2.236621, 2.035409, 1, 1, 1, 1, 1,
0.9076787, -1.138058, 1.401371, 1, 1, 1, 1, 1,
0.9087344, -0.07119397, 0.6491243, 1, 1, 1, 1, 1,
0.912317, -0.3797053, 2.880193, 1, 1, 1, 1, 1,
0.9143125, -0.3382328, 2.276669, 0, 0, 1, 1, 1,
0.9213177, -0.1416147, 0.9657071, 1, 0, 0, 1, 1,
0.9240542, -0.2410705, 1.335827, 1, 0, 0, 1, 1,
0.9317819, -0.4922774, 2.426579, 1, 0, 0, 1, 1,
0.9324738, 0.9216334, -0.8551483, 1, 0, 0, 1, 1,
0.9340951, -0.77826, 1.585644, 1, 0, 0, 1, 1,
0.9377801, 1.123405, 0.5218255, 0, 0, 0, 1, 1,
0.9486743, 0.9093739, 1.164602, 0, 0, 0, 1, 1,
0.9502957, 0.383377, 0.6085789, 0, 0, 0, 1, 1,
0.9681993, -1.404074, 1.077368, 0, 0, 0, 1, 1,
0.9822598, -1.5218, 3.862841, 0, 0, 0, 1, 1,
0.9887517, 0.5167953, 3.847751, 0, 0, 0, 1, 1,
0.9918224, -0.08005749, 1.59838, 0, 0, 0, 1, 1,
0.9956628, -0.02963924, -0.09656724, 1, 1, 1, 1, 1,
0.9964676, -1.920429, 4.080758, 1, 1, 1, 1, 1,
0.9971744, 0.5819456, 0.1680234, 1, 1, 1, 1, 1,
1.016487, -0.6451755, 2.025738, 1, 1, 1, 1, 1,
1.021727, -0.08435953, 2.879476, 1, 1, 1, 1, 1,
1.024803, 1.83654, 1.029913, 1, 1, 1, 1, 1,
1.027905, 0.1474575, 1.363818, 1, 1, 1, 1, 1,
1.030779, 1.019496, 0.001275671, 1, 1, 1, 1, 1,
1.031388, -0.4274023, 1.788102, 1, 1, 1, 1, 1,
1.046422, 0.7483542, 0.2920621, 1, 1, 1, 1, 1,
1.048619, -1.223062, 3.371034, 1, 1, 1, 1, 1,
1.055184, -0.3504863, 0.218964, 1, 1, 1, 1, 1,
1.05536, 0.2322717, 0.9724212, 1, 1, 1, 1, 1,
1.061197, 1.136079, -1.119096, 1, 1, 1, 1, 1,
1.062057, -0.6327157, 1.963187, 1, 1, 1, 1, 1,
1.067832, 0.5419298, -0.3715637, 0, 0, 1, 1, 1,
1.069477, 0.1698062, 1.966795, 1, 0, 0, 1, 1,
1.075186, 1.418952, 0.9342294, 1, 0, 0, 1, 1,
1.075482, -1.051651, 2.672909, 1, 0, 0, 1, 1,
1.07911, -0.5855115, 1.773439, 1, 0, 0, 1, 1,
1.082097, -0.8212861, 1.936041, 1, 0, 0, 1, 1,
1.091091, 1.198868, -0.681865, 0, 0, 0, 1, 1,
1.095486, -0.1319552, 3.793315, 0, 0, 0, 1, 1,
1.111349, -1.737148, 1.882537, 0, 0, 0, 1, 1,
1.11526, -1.023022, 2.04336, 0, 0, 0, 1, 1,
1.137319, -1.560108, 3.956087, 0, 0, 0, 1, 1,
1.137367, -1.031777, 2.268032, 0, 0, 0, 1, 1,
1.143176, -0.5424829, 2.587075, 0, 0, 0, 1, 1,
1.144436, 1.72822, -0.5902624, 1, 1, 1, 1, 1,
1.150887, -0.126152, 1.399136, 1, 1, 1, 1, 1,
1.155744, -0.1007634, 2.7663, 1, 1, 1, 1, 1,
1.158228, 2.422404, 0.03803729, 1, 1, 1, 1, 1,
1.171095, 0.005394275, 1.109354, 1, 1, 1, 1, 1,
1.172112, -0.7136784, 2.868273, 1, 1, 1, 1, 1,
1.173128, 1.831585, 0.2340306, 1, 1, 1, 1, 1,
1.190384, -2.308675, 1.893157, 1, 1, 1, 1, 1,
1.201369, 0.9484189, 2.233271, 1, 1, 1, 1, 1,
1.202867, -1.667235, 2.049482, 1, 1, 1, 1, 1,
1.204215, 0.5676074, 1.566007, 1, 1, 1, 1, 1,
1.208579, 1.565456, 0.09105432, 1, 1, 1, 1, 1,
1.209194, -2.124911, 3.663217, 1, 1, 1, 1, 1,
1.211272, 0.02213401, 1.26994, 1, 1, 1, 1, 1,
1.221911, 0.2594535, 1.311058, 1, 1, 1, 1, 1,
1.229792, 0.6877522, 2.268239, 0, 0, 1, 1, 1,
1.231831, -0.5572551, 0.03719811, 1, 0, 0, 1, 1,
1.24629, -0.3164617, 2.047843, 1, 0, 0, 1, 1,
1.253292, -0.3991736, 1.038204, 1, 0, 0, 1, 1,
1.2603, -0.9505914, 2.019522, 1, 0, 0, 1, 1,
1.263828, -0.438382, 2.867096, 1, 0, 0, 1, 1,
1.284112, 0.660454, 1.09906, 0, 0, 0, 1, 1,
1.298335, -1.30716, 3.246803, 0, 0, 0, 1, 1,
1.30006, -0.8472834, 0.9228944, 0, 0, 0, 1, 1,
1.305523, -0.5158595, -0.6763306, 0, 0, 0, 1, 1,
1.306194, -0.1040568, 2.197368, 0, 0, 0, 1, 1,
1.311642, -0.2366791, 0.3211074, 0, 0, 0, 1, 1,
1.312738, -0.3672482, 0.839011, 0, 0, 0, 1, 1,
1.322234, -0.1855233, 3.837643, 1, 1, 1, 1, 1,
1.325625, -0.213478, 2.747042, 1, 1, 1, 1, 1,
1.334522, -0.4282496, 3.595139, 1, 1, 1, 1, 1,
1.335712, -0.09105564, 2.945342, 1, 1, 1, 1, 1,
1.338861, -0.2653985, 1.736156, 1, 1, 1, 1, 1,
1.352389, 1.590999, 0.7234757, 1, 1, 1, 1, 1,
1.352482, -0.7725862, 2.056387, 1, 1, 1, 1, 1,
1.359572, 1.964422, 0.3212066, 1, 1, 1, 1, 1,
1.368799, 0.3923924, 1.374637, 1, 1, 1, 1, 1,
1.37328, 0.4877641, 1.182309, 1, 1, 1, 1, 1,
1.380408, -1.283174, 0.9512516, 1, 1, 1, 1, 1,
1.387277, -1.547529, 4.41941, 1, 1, 1, 1, 1,
1.395215, -0.3294962, 1.605207, 1, 1, 1, 1, 1,
1.39615, 1.410086, 0.03413656, 1, 1, 1, 1, 1,
1.404194, -0.2266288, 2.330348, 1, 1, 1, 1, 1,
1.407461, -1.072672, 2.559301, 0, 0, 1, 1, 1,
1.434072, 0.004804245, 0.7802739, 1, 0, 0, 1, 1,
1.434709, 1.766546, 1.475977, 1, 0, 0, 1, 1,
1.439182, -0.6733128, 2.669249, 1, 0, 0, 1, 1,
1.440789, 0.7192565, 0.988583, 1, 0, 0, 1, 1,
1.442051, 2.625383, 0.6491067, 1, 0, 0, 1, 1,
1.449793, 0.9266765, 1.867459, 0, 0, 0, 1, 1,
1.454889, -0.7968426, 3.720357, 0, 0, 0, 1, 1,
1.45524, -0.0326439, 3.075505, 0, 0, 0, 1, 1,
1.462271, 0.7147648, 1.693006, 0, 0, 0, 1, 1,
1.469436, -0.694767, 1.982712, 0, 0, 0, 1, 1,
1.475803, -0.5472242, 1.896356, 0, 0, 0, 1, 1,
1.476183, 0.2259204, 1.378253, 0, 0, 0, 1, 1,
1.480952, -1.354444, 2.324116, 1, 1, 1, 1, 1,
1.493809, -0.7996886, 1.120511, 1, 1, 1, 1, 1,
1.502233, -0.5857962, 1.742886, 1, 1, 1, 1, 1,
1.505482, 0.1836653, 0.2104661, 1, 1, 1, 1, 1,
1.509234, -1.365192, 1.481287, 1, 1, 1, 1, 1,
1.509392, 2.031086, -0.1884484, 1, 1, 1, 1, 1,
1.514942, 0.6017998, 2.646004, 1, 1, 1, 1, 1,
1.519176, -1.051249, 3.351928, 1, 1, 1, 1, 1,
1.525885, -0.5172911, 3.676293, 1, 1, 1, 1, 1,
1.541, -0.5720008, 1.32005, 1, 1, 1, 1, 1,
1.545129, -0.5282745, 0.5695637, 1, 1, 1, 1, 1,
1.547795, 0.3013698, 1.367678, 1, 1, 1, 1, 1,
1.554901, -0.3128373, 1.451887, 1, 1, 1, 1, 1,
1.56226, 1.980283, 0.3087989, 1, 1, 1, 1, 1,
1.568475, -1.814722, 2.093343, 1, 1, 1, 1, 1,
1.602939, 0.7457972, 1.391109, 0, 0, 1, 1, 1,
1.616824, -0.818391, 2.556538, 1, 0, 0, 1, 1,
1.634407, 0.2007477, 2.356727, 1, 0, 0, 1, 1,
1.639574, -0.3326973, 2.737644, 1, 0, 0, 1, 1,
1.661804, -0.185319, 2.564677, 1, 0, 0, 1, 1,
1.669372, 0.7730831, 1.178123, 1, 0, 0, 1, 1,
1.671923, -0.5055552, 2.729251, 0, 0, 0, 1, 1,
1.675308, 1.378044, 2.238375, 0, 0, 0, 1, 1,
1.678789, 1.558924, 2.536784, 0, 0, 0, 1, 1,
1.680117, -0.4780555, 2.908548, 0, 0, 0, 1, 1,
1.683321, -0.6621087, 3.84791, 0, 0, 0, 1, 1,
1.691517, -1.478644, 3.527659, 0, 0, 0, 1, 1,
1.727638, 0.8775725, 0.5629446, 0, 0, 0, 1, 1,
1.731596, -0.1867285, 1.929787, 1, 1, 1, 1, 1,
1.744491, -1.385649, 2.834477, 1, 1, 1, 1, 1,
1.755586, -0.7767805, 0.9527066, 1, 1, 1, 1, 1,
1.787254, -0.1128423, 1.167976, 1, 1, 1, 1, 1,
1.79565, 1.385496, -0.5122684, 1, 1, 1, 1, 1,
1.799041, -0.1397763, 2.12028, 1, 1, 1, 1, 1,
1.828834, 0.4165399, 0.8997542, 1, 1, 1, 1, 1,
1.840261, -1.313014, 2.173337, 1, 1, 1, 1, 1,
1.863858, -1.25444, 2.037796, 1, 1, 1, 1, 1,
1.865569, -0.8461642, 3.178775, 1, 1, 1, 1, 1,
1.891541, -0.5144261, 2.975893, 1, 1, 1, 1, 1,
1.89448, 0.3708686, 1.119258, 1, 1, 1, 1, 1,
1.917167, -1.123353, 1.955309, 1, 1, 1, 1, 1,
1.971103, 0.1863534, 1.722888, 1, 1, 1, 1, 1,
2.000914, 1.255707, 1.338938, 1, 1, 1, 1, 1,
2.087988, 0.5857843, 1.953796, 0, 0, 1, 1, 1,
2.098016, -0.1357225, 2.504876, 1, 0, 0, 1, 1,
2.175182, -1.15569, 0.1484817, 1, 0, 0, 1, 1,
2.20692, 0.3878482, 2.05286, 1, 0, 0, 1, 1,
2.269157, -0.3753725, 2.048525, 1, 0, 0, 1, 1,
2.307615, -0.09902278, 0.8865813, 1, 0, 0, 1, 1,
2.325588, -1.532566, 2.605808, 0, 0, 0, 1, 1,
2.373592, -0.1204606, 2.756218, 0, 0, 0, 1, 1,
2.399751, 0.8569373, 0.9075954, 0, 0, 0, 1, 1,
2.412337, 0.7295749, 2.791102, 0, 0, 0, 1, 1,
2.412802, 0.7220104, 2.728069, 0, 0, 0, 1, 1,
2.452774, 0.6405705, 0.1420252, 0, 0, 0, 1, 1,
2.512458, -0.8304305, 1.053298, 0, 0, 0, 1, 1,
2.527554, 0.8766682, -0.3823035, 1, 1, 1, 1, 1,
2.586879, 1.078312, 1.086255, 1, 1, 1, 1, 1,
2.688912, -0.5493731, 1.644935, 1, 1, 1, 1, 1,
2.830601, 1.247669, -0.724501, 1, 1, 1, 1, 1,
3.017994, 1.751864, -0.3126843, 1, 1, 1, 1, 1,
3.27461, 0.1316583, 1.263669, 1, 1, 1, 1, 1,
3.637706, -0.5228236, 1.72576, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.168834;
var distance = 32.20514;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2962847, -0.1911522, -0.2410369 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.20514);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
